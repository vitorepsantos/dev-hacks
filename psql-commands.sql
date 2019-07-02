-- PostgreSQL 9.1+

-- Connect to DB
psql -h <host_ip> -p <port> -U <dbuser> <dbname>

-- Restore a backup
psql -h <host_ip> -p <port> -U <dbuser> -d <dbname> < <filepath>
psql -h localhost -p 5432 -U mydbuser -d mylocaldb < E:\\mybkpfile.bkp

-- Save query result into file
psql -h <host_ip> -p <port> -U <dbuser> -d <dbname> -t -A -c "sql-query" > <filepath>
psql -h localhost -p 5432 -U mydbuser -d mylocaldb -t -A -c "SELECT * FROM mytable;" > E:\\myqueryresult.txt

-- Script
psql -h <host_ip> -p <port> -U <dbuser> -d <dbname> -f <filepath.sql>
psql -h localhost -p 5432 -U mydbuser -d mylocaldb -f /home/user/myscript.sql

-- SQL query to clean DB
VACUUM FULL FREEZE VERBOSE;
