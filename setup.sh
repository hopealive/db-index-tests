#!/bin/sh

docker-compose up -d

docker exec -i testdb_57 mysql -u user -ppassword db1 < sql/dummy-mysq.sql
docker exec -i testdb_55 mysql -u user -ppassword db1 < sql/dummy-mysq.sql
docker exec -i testdb_pg10 psql -U postgres -d postgres < sql/dummy-pg.sql
docker exec -i testdb_pg14 psql -U postgres -d postgres < sql/dummy-pg.sql

php map.php

docker exec -i testdb_57 mysql -u user -ppassword db1 < sql/data.sql
docker exec -i testdb_55 mysql -u user -ppassword db1 < sql/data.sql
docker exec -i testdb_pg10 psql -U postgres -d postgres < sql/data.sql
docker exec -i testdb_pg14 psql -U postgres -d postgres < sql/data.sql

