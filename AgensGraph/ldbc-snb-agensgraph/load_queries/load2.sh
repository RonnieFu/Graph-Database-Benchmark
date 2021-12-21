#!/bin/bash
#
# This script loads make the LDBC schema and load the specified dataset.
# 
# ./load.sh [CONFIGURATION_FILE]

source $1

agens -d $DBNAME -p $PORT -U $USER -f load_queries/enable_fdw.sql -L ldbc_loading.log -q -o load_output.log 2>/dev/null

if [ $? -eq 0 ]; then
	echo "enable_fdw succeed!"
else
	echo "enable_fdw failed!"
fi

agens -d $DBNAME -p $PORT -U $USER -v source_path=$DATAPATH -v target_db=$DBNAME -f load_queries/schema.sql -L ldbc_loading.log -q -o load_output.log 2>/dev/null

if [ $? -eq 0 ]; then
        echo "load schema.sql succeed!"
else
        echo "load schema.sql failed!"
fi

agens -d $DBNAME -p $PORT -U $USER -f load_queries/load_vertexes2.sql -L ldbc_loading.log -q -o load_output.log 2>/dev/null

if [ $? -eq 0 ]; then
        echo "load vertex2.sql succeed!"
else
        echo "load vertex2.sql failed!"
fi

agens -d $DBNAME -p $PORT -U $USER -f load_queries/create_vertex_property_indexes2.sql -L ldbc_loading.log -q -o load_output.log 2>/dev/null

if [ $? -eq 0 ]; then
        echo "create_vertex_property_indexes2 succeed!"
else
        echo "create_vertex_property_indexes2 failed!"
fi

agens -d $DBNAME -p $PORT -U $USER -f load_queries/load_edges2.sql -L ldbc_loading.log -q -o load_output.log 2>/dev/null

if [ $? -eq 0 ]; then
        echo "load edges2.sql succeed!"
else
        echo "load edges2.sql failed!"
fi

agens -d $DBNAME -p $PORT -U $USER -f load_queries/analyze_vertexes2.sql -L ldbc_loading.log -q -o load_output.log 2>/dev/null

if [ $? -eq 0 ]; then
        echo "analyze vertex2.sql succeed!"
else
        echo "analyze vertex2.sql failed!"
fi

agens -d $DBNAME -p $PORT -U $USER -f load_queries/analyze_edges2.sql -L ldbc_loading.log -q -o load_output.log 2>/dev/null

if [ $? -eq 0 ]; then
        echo "analyze edges2.sql succeed!"
else
        echo "analyze edges2.sql failed!"
fi

agens -d $DBNAME -p $PORT -U $USER -f load_queries/reindex2.sql -L ldbc_loading.log -q -o load_output.log 2>/dev/null

if [ $? -eq 0 ]; then
        echo "reindex2.sql succeed!"
else
        echo "reindex2.sql failed!"
fi

agens -d $DBNAME -p $PORT -U $USER -f load_queries/prewarm2.sql -L ldbc_loading.log -q -o load_output.log 2>/dev/null

if [ $? -eq 0 ]; then
        echo "prewarm2.sql succeed!"
else
        echo "prewarm2.sql failed!"
fi

