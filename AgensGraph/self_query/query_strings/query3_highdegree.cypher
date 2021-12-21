MATCH (p1:Person {id:2199023262543})-[:knows]->(p2:Person)-[:knows]->(p3:Person)
RETURN
collect(p2.id),
collect(p3.id);

