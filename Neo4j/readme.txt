#1. the import-to-neo4j-without-docker.sh is used to load the LDBC dataset files under the neo4j rootdirectory. 
# The NEO4J_HOME and NEO4J_CSV_POSTFIX needs to be specified in the .bashrc. 
 
#2.RecBench.py is a python file which is used to execute the different query in the neo4j you could use these instruction to execute,

pip install py2neo

python RecBench.py 

#the "query3" and ls1["0"] needs to be altered, according to the query you want to use,

graph.run(query3,parameters={"personId":ls1[0]})

#this list contains the high, middle, low degree vertex id from left to the right.
ls1 =[2199023262543,24189255821300,9321]

#if you want to make a trial run on the query1 and middle degree vertex, this line should be changed to
graph.run(query1,parameters={"personId":ls1[1]})

#In order to examine the each query independently, we need to restart the neo4j after each python script execution  