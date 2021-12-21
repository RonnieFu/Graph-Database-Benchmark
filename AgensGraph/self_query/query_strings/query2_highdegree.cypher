MATCH (p1:Person {id:2199023262543})-[:knows]->(p2:Person {gender:'male'})-[:hasInterest]->(t:Tag)
RETURN
t.id AS tagId,
t.name AS tagName

