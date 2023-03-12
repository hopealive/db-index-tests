#!/bin/sh

# Mysql 5.7
docker exec testdb_57 mysql -u user -ppassword db1 < sql/drop-key-mysql.sql

start=$(date +%s.%N)
docker exec testdb_57 mysql -u user -ppassword db1 < sql/test-mysql.sql
dur=$(echo "$(date +%s.%N) - $start" | bc)
printf "Execution time mysql 5.7: %.6f seconds \n" $dur

docker exec testdb_57 mysql -u user -ppassword db1 < sql/test-key-mysql.sql

start=$(date +%s.%N)
docker exec testdb_57 mysql -u user -ppassword db1 < sql/test-mysql.sql
dur=$(echo "$(date +%s.%N) - $start" | bc)
printf "Execution time mysql 5.7: %.6f seconds \n" $dur


# Mysql 5.5
docker exec testdb_55 mysql -u user -ppassword db1 < sql/drop-key-mysql.sql

start=$(date +%s.%N)
docker exec testdb_55 mysql -u user -ppassword db1 < sql/test-mysql.sql
dur=$(echo "$(date +%s.%N) - $start" | bc)
printf "Execution time mysql 5.5: %.6f seconds \n" $dur

docker exec testdb_55 mysql -u user -ppassword db1 < sql/test-key-mysql.sql

start=$(date +%s.%N)
docker exec testdb_55 mysql -u user -ppassword db1 < sql/test-mysql.sql
dur=$(echo "$(date +%s.%N) - $start" | bc)
printf "Execution time mysql 5.5: %.6f seconds \n" $dur


# Postgres 10
docker exec testdb_pg10 psql -U postgres -d postgres < sql/drop-key-pg.sql

start=$(date +%s.%N)
docker exec testdb_pg10 psql -U postgres -d postgres < sql/test-pg.sql
dur=$(echo "$(date +%s.%N) - $start" | bc)
printf "Execution time Postgres 10: %.6f seconds \n" $dur

docker exec testdb_pg10 psql -U postgres -d postgres < sql/test-key-pg.sql

start=$(date +%s.%N)
docker exec testdb_pg10 psql -U postgres -d postgres < sql/test-pg.sql
dur=$(echo "$(date +%s.%N) - $start" | bc)
printf "Execution time Postgres 10: %.6f seconds \n" $dur


# docker exec -i testdb_pg10 psql -U postgres -d postgres < sql/test-key-pg.sql
# docker exec -i testdb_pg14 psql -U postgres -d postgres < sql/test-key-pg.sql
