# Migration `20200527114044-init`

This migration has been generated at 5/27/2020, 11:40:44 AM.
You can check out the [state of the schema](./schema.prisma) after the migration.

## Database Steps

```sql
CREATE TABLE "public"."User" (
"email" text  NOT NULL ,"id" SERIAL,"name" text   ,
    PRIMARY KEY ("id"))

CREATE TABLE "public"."Post" (
"authorId" integer   ,"content" text   ,"id" SERIAL,"published" boolean  NOT NULL DEFAULT false,"title" text  NOT NULL ,
    PRIMARY KEY ("id"))

CREATE UNIQUE INDEX "User.email" ON "public"."User"("email")

ALTER TABLE "public"."Post" ADD FOREIGN KEY ("authorId")REFERENCES "public"."User"("id") ON DELETE SET NULL  ON UPDATE CASCADE
```

## Changes

```diff
diff --git schema.prisma schema.prisma
migration ..20200527114044-init
--- datamodel.dml
+++ datamodel.dml
@@ -1,0 +1,24 @@
+generator client {
+  provider = "prisma-client-js"
+}
+
+datasource db {
+  provider = "postgresql"
+  url      = "postgresql://bjoern@localhost:5432/test"
+}
+
+model User {
+  email String  @unique
+  id    Int     @default(autoincrement()) @id
+  name  String?
+  posts Post[]
+}
+
+model Post {
+  authorId  Int?
+  content   String?
+  id        Int     @default(autoincrement()) @id
+  published Boolean @default(false)
+  title     String
+  author    User?   @relation(fields: [authorId], references: [id])
+}
```


