#!/bin/bash
#This script used to execute interactive query

start_time=$(date +%s%N)
start_time_ms=${start_time:0:16}

DBNAME=ldbc_interactive
PORT=5432
USER=s166098

agens -d "$DBNAME" -p "$PORT" -U "$USER" -f query_strings/query4_highdegree.cypher -o result.log

end_time=$(date +%s%N)
end_time_ms=${end_time:0:16}

take_time=$((end_time_ms - start_time_ms))

echo "Time taken to execute"
echo "scale=6;${take_time}/1000000" | bc
echo "seconds"
