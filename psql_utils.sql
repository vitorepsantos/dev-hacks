# Connect to DB
psql -h <host_ip> -p <port> -U <dbuser> <dbname>

# Restore a backup
psql -h <host_ip> -p <port> -U <dbuser> -d <dbname> < <bkp_file>
psql -h localhost -p 5432 -U mydbuser -d mylocaldb < E:\\mybkpfile.bkp
