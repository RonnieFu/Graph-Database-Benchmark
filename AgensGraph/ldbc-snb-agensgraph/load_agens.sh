#!/bin/bash
#
# This script loads make the LDBC schema and load the specified dataset.
# 
USER=s166098
AGENS_PORT=5432
DBNAME=ldbc_interactive
DATA_PATH=/home/s166098/graph_databases/social_network


agens -d "$DBNAME" -p "$AGENS_PORT" -U "$USER" --echo-all -P pager=off -f load_queries/enable_fdw.sql
agens -d "$DBNAME" -p "$AGENS_PORT" -U "$USER" --echo-all -P pager=off -v source_path="$DATA_PATH" -v target_db="$DBNAME" -f load_queries/schema.sql

agens -d "$DBNAME" -p "$AGENS_PORT" -U "$USER" --echo-all -P pager=off -f load_queries/load_vertexes2.sql
agens -d "$DBNAME" -p "$AGENS_PORT" -U "$USER" --echo-all -P pager=off -f load_queries/create_vertex_property_indexes2.sql
agens -d "$DBNAME" -p "$AGENS_PORT" -U "$USER" --echo-all -P pager=off -f load_queries/load_edges2.sql
agens -d "$DBNAME" -p "$AGENS_PORT" -U "$USER" --echo-all -P pager=off -f load_queries/analyze_vertexes2.sql
agens -d "$DBNAME" -p "$AGENS_PORT" -U "$USER" --echo-all -P pager=off -f load_queries/analyze_edges2.sql
agens -d "$DBNAME" -p "$AGENS_PORT" -U "$USER" --echo-all -P pager=off -f load_queries/reindex2.sql
agens -d "$DBNAME" -p "$AGENS_PORT" -U "$USER" --echo-all -P pager=off -f load_queries/prewarm2.sql | grep PREWARM | grep -v oid >prewarm.sql

agens -d "$DBNAME" -p "$AGENS_PORT" -U "$USER" --echo-all -P pager=off -f load_queries/weight_precal.sql
agens -d "$DBNAME" -p "$AGENS_PORT" -U "$USER" --echo-all -P pager=off -f load_queries/proc.sql

agens -d "$DBNAME" -p "$AGENS_PORT" -U "$USER" --echo-all -P pager=off -f load_queries/alter_logged.sql
