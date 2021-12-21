#!/bin/bash
# 
# A template for LDBC dataset loading script
#
# Usage: Copy this template, modify the copied one to fill out information needed
#        change its permission (chmod +x [filename]) and run it.
#
# Note:  Before run this script, the database to use should be created before.

# Modify this variables
PORT=5432
USER=s166098
DBNAME=ldbc_interactive
DATAPATH=/home/s166098/graph_databases/social_network

echo " =================================== "
echo " AgensGraph LDBC data loading script "
echo " =================================== "
echo

if [ -z "$PORT" ] || [ -z "$USER" ] || [ -z "$DBNAME" ] || [ -z "$DATAPATH" ]; then 
  echo "[ERROR] Fill out the empty variables (PORT, USER, DBNAME, DATAPATH)"
  exit 1
fi

cat > load.conf <<EOF
DBNAME=$DBNAME
PORT=$PORT
USER=$USER
DATAPATH=$DATAPATH
EOF

load_queries/load2.sh load.conf
rm -f load.conf

