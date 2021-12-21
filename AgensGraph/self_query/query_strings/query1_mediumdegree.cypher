MATCH (p1:Person {id:24189255821300})-[:knows]->(p2:Person)-[:hasInterest]->(t:Tag)
RETURN
t.id AS tagId,
t.name AS tagName

