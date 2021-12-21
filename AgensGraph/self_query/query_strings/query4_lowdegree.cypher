MATCH (p1:Person {id:9321})-[:knows]->(p2:Person {gender:'male'})-[:knows]->(p3:Person {gender:'male'})
RETURN
collect(p2.id),
collect(p3.id);

