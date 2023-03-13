#!/bin/sh

LOG_FILE="test.log"

### MYSQL
mysqlConnString="mysql -u user -ppassword db1 -e"
mysqlDropKey="ALTER TABLE test_table DROP KEY agent_id_date;"
mysqlAddKey="ALTER TABLE test_table ADD KEY agent_id_date (agent_id, date desc);"
mysqlTestQuery="SELECT * FROM test_table WHERE agent_id = 1000 and date > now() - interval 30 day ORDER BY date DESC;"
mysqlTestIdQuery="SELECT * FROM test_table WHERE agent_id = 1000 and date > now() - interval 30 day ORDER BY ID DESC;"

# Mysql 5.7
docker exec testdb_57 $mysqlConnString "$mysqlDropKey"
docker exec testdb_57 $mysqlConnString "$mysqlAddKey"

start=$(date +%s.%N)
docker exec testdb_57 $mysqlConnString "$mysqlTestQuery"
dur=$(echo "$(date +%s.%N) - $start" | bc)
printf "Execution time mysql 5.7: %.6f seconds \n" $dur >> $LOG_FILE

start=$(date +%s.%N)
docker exec testdb_57 $mysqlConnString "$mysqlTestIdQuery"
dur=$(echo "$(date +%s.%N) - $start" | bc)
printf "Execution time mysql 5.7, sort By ID: %.6f seconds \n" $dur >> $LOG_FILE


# Mysql 5.5
docker exec testdb_55 $mysqlConnString "$mysqlDropKey"
docker exec testdb_55 $mysqlConnString "$mysqlAddKey"

start=$(date +%s.%N)
docker exec testdb_55 $mysqlConnString "$mysqlTestQuery"
dur=$(echo "$(date +%s.%N) - $start" | bc)
printf "Execution time mysql 5.5: %.6f seconds \n" $dur >> $LOG_FILE

start=$(date +%s.%N)
docker exec testdb_57 $mysqlConnString "$mysqlTestIdQuery"
dur=$(echo "$(date +%s.%N) - $start" | bc)
printf "Execution time mysql 5.7, sort By ID: %.6f seconds \n" $dur >> $LOG_FILE


### Postgres
pgConnString="psql -U postgres -d postgres -c"
pgDropKey="DROP INDEX fk_test_table_agent_id_date_idx;"
pgAddKey="CREATE INDEX fk_test_table_agent_id_date_idx ON test_table (agent_id, date desc);"
pgTestQuery="SELECT * FROM test_table WHERE agent_id = 1000 and date > now() - interval '30 day' ORDER BY date DESC;"
pgTestIdQuery="SELECT * FROM test_table WHERE agent_id = 1000 and date > now() - interval '30 day' ORDER BY id DESC;"

# Postgres 14
dbHost=testdb_pg14
docker exec $dbHost $pgConnString "$pgDropKey"
docker exec $dbHost $pgConnString "$pgAddKey"

start=$(date +%s.%N)
docker exec $dbHost $pgConnString "$pgTestQuery"
docker exec testdb_pg14 psql -U postgres -d postgres -c "SELECT * FROM test_table"
dur=$(echo "$(date +%s.%N) - $start" | bc)
printf "Execution time Postgres 14: %.6f seconds \n" $dur >> $LOG_FILE


start=$(date +%s.%N)
docker exec $dbHost $pgConnString "$pgTestIdQuery"
dur=$(echo "$(date +%s.%N) - $start" | bc)
printf "Execution time Postgres 14, sort By ID: %.6f seconds \n" $dur >> $LOG_FILE


# Postgres 10
dbHost=testdb_pg10
docker exec $dbHost $pgConnString "$pgDropKey"
docker exec $dbHost $pgConnString "$pgAddKey"

start=$(date +%s.%N)
docker exec $dbHost $pgConnString "$pgTestQuery"
docker exec testdb_pg14 psql -U postgres -d postgres -c "SELECT * FROM test_table"
dur=$(echo "$(date +%s.%N) - $start" | bc)
printf "Execution time Postgres 14: %.6f seconds \n" $dur >> $LOG_FILE


start=$(date +%s.%N)
docker exec $dbHost $pgConnString "$pgTestIdQuery"
dur=$(echo "$(date +%s.%N) - $start" | bc)
printf "Execution time Postgres 14, sort By ID: %.6f seconds \n" $dur >> $LOG_FILE