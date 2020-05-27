--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."User" (email, id, name) VALUES ('test@gmail.com', 1, 'asdasd');


--
-- Data for Name: Post; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: _Migration; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."_Migration" (revision, name, datamodel, status, applied, rolled_back, datamodel_steps, database_migration, errors, started_at, finished_at) VALUES (1, '20200527114044-init', 'datasource db {
  provider = "postgresql"
  url      = "postgresql://bjoern@localhost:5432/test"
}

model User {
  email String  @unique
  id    Int     @default(autoincrement()) @id
  name  String?
  posts Post[]
}

model Post {
  authorId  Int?
  content   String?
  id        Int     @default(autoincrement()) @id
  published Boolean @default(false)
  title     String
  author    User?   @relation(fields: [authorId], references: [id])
}', 'MigrationSuccess', 3, 0, '[{"tag":"CreateSource","source":"db"},{"tag":"CreateArgument","location":{"tag":"Source","source":"db"},"argument":"provider","value":"\"postgresql\""},{"tag":"CreateArgument","location":{"tag":"Source","source":"db"},"argument":"url","value":"\"postgresql://bjoern@localhost:5432/test\""},{"tag":"CreateModel","model":"User"},{"tag":"CreateField","model":"User","field":"email","type":"String","arity":"Required"},{"tag":"CreateDirective","location":{"path":{"tag":"Field","model":"User","field":"email"},"directive":"unique"}},{"tag":"CreateField","model":"User","field":"id","type":"Int","arity":"Required"},{"tag":"CreateDirective","location":{"path":{"tag":"Field","model":"User","field":"id"},"directive":"default"}},{"tag":"CreateArgument","location":{"tag":"Directive","path":{"tag":"Field","model":"User","field":"id"},"directive":"default"},"argument":"","value":"autoincrement()"},{"tag":"CreateDirective","location":{"path":{"tag":"Field","model":"User","field":"id"},"directive":"id"}},{"tag":"CreateField","model":"User","field":"name","type":"String","arity":"Optional"},{"tag":"CreateField","model":"User","field":"posts","type":"Post","arity":"List"},{"tag":"CreateModel","model":"Post"},{"tag":"CreateField","model":"Post","field":"authorId","type":"Int","arity":"Optional"},{"tag":"CreateField","model":"Post","field":"content","type":"String","arity":"Optional"},{"tag":"CreateField","model":"Post","field":"id","type":"Int","arity":"Required"},{"tag":"CreateDirective","location":{"path":{"tag":"Field","model":"Post","field":"id"},"directive":"default"}},{"tag":"CreateArgument","location":{"tag":"Directive","path":{"tag":"Field","model":"Post","field":"id"},"directive":"default"},"argument":"","value":"autoincrement()"},{"tag":"CreateDirective","location":{"path":{"tag":"Field","model":"Post","field":"id"},"directive":"id"}},{"tag":"CreateField","model":"Post","field":"published","type":"Boolean","arity":"Required"},{"tag":"CreateDirective","location":{"path":{"tag":"Field","model":"Post","field":"published"},"directive":"default"}},{"tag":"CreateArgument","location":{"tag":"Directive","path":{"tag":"Field","model":"Post","field":"published"},"directive":"default"},"argument":"","value":"false"},{"tag":"CreateField","model":"Post","field":"title","type":"String","arity":"Required"},{"tag":"CreateField","model":"Post","field":"author","type":"User","arity":"Optional"},{"tag":"CreateDirective","location":{"path":{"tag":"Field","model":"Post","field":"author"},"directive":"relation"}},{"tag":"CreateArgument","location":{"tag":"Directive","path":{"tag":"Field","model":"Post","field":"author"},"directive":"relation"},"argument":"fields","value":"[authorId]"},{"tag":"CreateArgument","location":{"tag":"Directive","path":{"tag":"Field","model":"Post","field":"author"},"directive":"relation"},"argument":"references","value":"[id]"}]', '{"before":{"tables":[{"name":"_Migration","columns":[{"name":"applied","tpe":{"dataType":"integer","fullDataType":"int4","family":"int","arity":"required"},"default":null,"autoIncrement":false},{"name":"database_migration","tpe":{"dataType":"text","fullDataType":"text","family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"datamodel","tpe":{"dataType":"text","fullDataType":"text","family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"datamodel_steps","tpe":{"dataType":"text","fullDataType":"text","family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"errors","tpe":{"dataType":"text","fullDataType":"text","family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"finished_at","tpe":{"dataType":"timestamp without time zone","fullDataType":"timestamp","family":"dateTime","arity":"nullable"},"default":null,"autoIncrement":false},{"name":"name","tpe":{"dataType":"text","fullDataType":"text","family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"revision","tpe":{"dataType":"integer","fullDataType":"int4","family":"int","arity":"required"},"default":{"SEQUENCE":"nextval(''\"_Migration_revision_seq\"''::regclass)"},"autoIncrement":true},{"name":"rolled_back","tpe":{"dataType":"integer","fullDataType":"int4","family":"int","arity":"required"},"default":null,"autoIncrement":false},{"name":"started_at","tpe":{"dataType":"timestamp without time zone","fullDataType":"timestamp","family":"dateTime","arity":"required"},"default":null,"autoIncrement":false},{"name":"status","tpe":{"dataType":"text","fullDataType":"text","family":"string","arity":"required"},"default":null,"autoIncrement":false}],"indices":[],"primaryKey":{"columns":["revision"],"sequence":{"name":"_Migration_revision_seq","initialValue":1,"allocationSize":1}},"foreignKeys":[]}],"enums":[],"sequences":[{"name":"_Migration_revision_seq","initialValue":1,"allocationSize":1}]},"after":{"tables":[{"name":"User","columns":[{"name":"email","tpe":{"dataType":"","fullDataType":"","family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"id","tpe":{"dataType":"","fullDataType":"","family":"int","arity":"required"},"default":null,"autoIncrement":true},{"name":"name","tpe":{"dataType":"","fullDataType":"","family":"string","arity":"nullable"},"default":null,"autoIncrement":false}],"indices":[{"name":"User.email","columns":["email"],"tpe":"unique"}],"primaryKey":{"columns":["id"],"sequence":null},"foreignKeys":[]},{"name":"Post","columns":[{"name":"authorId","tpe":{"dataType":"","fullDataType":"","family":"int","arity":"nullable"},"default":null,"autoIncrement":false},{"name":"content","tpe":{"dataType":"","fullDataType":"","family":"string","arity":"nullable"},"default":null,"autoIncrement":false},{"name":"id","tpe":{"dataType":"","fullDataType":"","family":"int","arity":"required"},"default":null,"autoIncrement":true},{"name":"published","tpe":{"dataType":"","fullDataType":"","family":"boolean","arity":"required"},"default":{"VALUE":false},"autoIncrement":false},{"name":"title","tpe":{"dataType":"","fullDataType":"","family":"string","arity":"required"},"default":null,"autoIncrement":false}],"indices":[],"primaryKey":{"columns":["id"],"sequence":null},"foreignKeys":[{"constraintName":null,"columns":["authorId"],"referencedTable":"User","referencedColumns":["id"],"onDeleteAction":"setNull"}]}],"enums":[],"sequences":[]},"original_steps":[{"CreateTable":{"table":{"name":"User","columns":[{"name":"email","tpe":{"dataType":"","fullDataType":"","family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"id","tpe":{"dataType":"","fullDataType":"","family":"int","arity":"required"},"default":null,"autoIncrement":true},{"name":"name","tpe":{"dataType":"","fullDataType":"","family":"string","arity":"nullable"},"default":null,"autoIncrement":false}],"indices":[{"name":"User.email","columns":["email"],"tpe":"unique"}],"primaryKey":{"columns":["id"],"sequence":null},"foreignKeys":[]}}},{"CreateTable":{"table":{"name":"Post","columns":[{"name":"authorId","tpe":{"dataType":"","fullDataType":"","family":"int","arity":"nullable"},"default":null,"autoIncrement":false},{"name":"content","tpe":{"dataType":"","fullDataType":"","family":"string","arity":"nullable"},"default":null,"autoIncrement":false},{"name":"id","tpe":{"dataType":"","fullDataType":"","family":"int","arity":"required"},"default":null,"autoIncrement":true},{"name":"published","tpe":{"dataType":"","fullDataType":"","family":"boolean","arity":"required"},"default":{"VALUE":false},"autoIncrement":false},{"name":"title","tpe":{"dataType":"","fullDataType":"","family":"string","arity":"required"},"default":null,"autoIncrement":false}],"indices":[],"primaryKey":{"columns":["id"],"sequence":null},"foreignKeys":[{"constraintName":null,"columns":["authorId"],"referencedTable":"User","referencedColumns":["id"],"onDeleteAction":"setNull"}]}}},{"CreateIndex":{"table":"User","index":{"name":"User.email","columns":["email"],"tpe":"unique"}}},{"AddForeignKey":{"table":"Post","foreign_key":{"constraintName":null,"columns":["authorId"],"referencedTable":"User","referencedColumns":["id"],"onDeleteAction":"setNull"}}}],"corrected_steps":[{"CreateTable":{"table":{"name":"User","columns":[{"name":"email","tpe":{"dataType":"","fullDataType":"","family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"id","tpe":{"dataType":"","fullDataType":"","family":"int","arity":"required"},"default":null,"autoIncrement":true},{"name":"name","tpe":{"dataType":"","fullDataType":"","family":"string","arity":"nullable"},"default":null,"autoIncrement":false}],"indices":[{"name":"User.email","columns":["email"],"tpe":"unique"}],"primaryKey":{"columns":["id"],"sequence":null},"foreignKeys":[]}}},{"CreateTable":{"table":{"name":"Post","columns":[{"name":"authorId","tpe":{"dataType":"","fullDataType":"","family":"int","arity":"nullable"},"default":null,"autoIncrement":false},{"name":"content","tpe":{"dataType":"","fullDataType":"","family":"string","arity":"nullable"},"default":null,"autoIncrement":false},{"name":"id","tpe":{"dataType":"","fullDataType":"","family":"int","arity":"required"},"default":null,"autoIncrement":true},{"name":"published","tpe":{"dataType":"","fullDataType":"","family":"boolean","arity":"required"},"default":{"VALUE":false},"autoIncrement":false},{"name":"title","tpe":{"dataType":"","fullDataType":"","family":"string","arity":"required"},"default":null,"autoIncrement":false}],"indices":[],"primaryKey":{"columns":["id"],"sequence":null},"foreignKeys":[{"constraintName":null,"columns":["authorId"],"referencedTable":"User","referencedColumns":["id"],"onDeleteAction":"setNull"}]}}},{"CreateIndex":{"table":"User","index":{"name":"User.email","columns":["email"],"tpe":"unique"}}},{"AddForeignKey":{"table":"Post","foreign_key":{"constraintName":null,"columns":["authorId"],"referencedTable":"User","referencedColumns":["id"],"onDeleteAction":"setNull"}}}],"rollback":[{"DropTable":{"name":"User"}},{"DropTable":{"name":"Post"}}]}', '[]', '2020-05-27 10:40:49.005', '2020-05-27 10:40:49.033');


--
-- Name: Post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Post_id_seq"', 1, false);


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."User_id_seq"', 1, true);


--
-- Name: _Migration_revision_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."_Migration_revision_seq"', 1, true);


--
-- PostgreSQL database dump complete
--

