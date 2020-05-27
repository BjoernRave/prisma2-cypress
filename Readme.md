To generate the sql dump I run the following command:

```bash
pg_dump --no-publications --no-security-labels --no-subscriptions -O --no-tablespaces --no-comments -a --column-inserts --attribute-inserts -d postgresql://postgres@localhost:5432/test > test.sql
```
