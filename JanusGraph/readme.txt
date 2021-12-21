#load-ldbc-data.groovy is a groovy script to load data to janusgraph

#set these two lines to your own directory paths, and your own configuration of JanusGraph
inputBaseDir = "/home/s164822/LDBC_benchmark/DATAGEN/dataAll"
graph = JanusGraphFactory.open('conf/janusgraph-cql-lucene.properties')

# use this instruction to load dataset to janusgraph
gremlin.sh -e load-ldbc-data.groovy
