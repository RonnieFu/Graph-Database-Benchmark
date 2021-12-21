from py2neo import *
from datetime import datetime
# type 1 query without filter
query1='''MATCH (p1:Person {id:$personId})-[:KNOWS]->(p2:Person)-[:HAS_INTEREST]->(t:Tag)
RETURN 
t.id AS tagId,
t.name AS tagName;
'''
# type 1 query with filter
query2='''MATCH (p1:Person {id:$personId})-[:KNOWS]->(p2:Person {gender:'male'})-[:HAS_INTEREST]->(t:Tag)
RETURN
t.id AS tagId,
t.name AS tagName;
'''

# type 2 query without filter
query3='''MATCH (p1:Person {id:$personId})-[:KNOWS]->(p2:Person)-[:KNOWS]->(p3:Person)
RETURN
collect(p2.id),
collect(p3.id);
'''
# type 2 query with filter
query4 = '''MATCH (p1:Person {id:$personId})-[:KNOWS]->(p2:Person {gender:'male'})-[:KNOWS]->(p3:Person  {gender:'male'})
RETURN
collect(p2.id),
collect(p3.id);
'''

graph = Graph("http://localhost:7474")
ls1 =[2199023262543,24189255821300,9321]

startTime = datetime.now()
graph.run(query3,parameters={"personId":ls1[0]})
endTime= datetime.now()
print((endTime-startTime))
