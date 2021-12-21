About how to load data into AgensGraph:

The folder ldbc-snb-agensraph is used to load data to Agensgraph

Before running the script, you should firstly start the server of AgensGraph and create the database named "ldbc_interactive"

Modify the the bash script called "load_agens.sh"

Run the script, so the graph data can be loaded into AgensGraph


About the benchmark:

A folder called "query_strings" in self_query contains the Cypher queries

The bash script "query_script.sh" is used to link to the console of database in AgensGraph. Before runing this script, you should modify the cypher query file after the parameter "-f"

About the query results:

The file called "Agensgraph Result.txt" reserves the latency of execute 4 different kinds of queries in 3 various degrees.