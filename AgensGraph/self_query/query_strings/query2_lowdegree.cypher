MATCH (p1:Person {id:9321})-[:knows]->(p2:Person {gender:'male'})-[:hasInterest]->(t:Tag)
RETURN
t.id AS tagId,
t.name AS tagName
