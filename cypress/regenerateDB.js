const { PrismaClient } = require('@prisma/client')
const fs = require('fs')

const prisma = new PrismaClient()

export const regenerateDB = async () => {
  await prisma.raw`
DO
$func$
BEGIN
  EXECUTE
  (SELECT 'TRUNCATE TABLE ' || string_agg(oid::regclass::text, ', ') || ' RESTART IDENTITY CASCADE'
    FROM   pg_class
    WHERE  relkind = 'r'  -- only tables
    AND    relnamespace = 'public'::regnamespace
  );
END
$func$;
`

  const sqls = fs
    .readFileSync(__dirname + '/test.sql')
    .toString()
    .split('\n')
    .filter((line) => line.indexOf('--') !== 0)
    .join('\n')
    .replace(/(\r\n|\n|\r)/gm, ' ') // remove newlines
    .replace(/\s+/g, ' ') // excess white space
    .split(';')

  for (const sql of sqls) {
    await prisma.raw(sql)
  }

  await prisma.disconnect()
  return null
}
