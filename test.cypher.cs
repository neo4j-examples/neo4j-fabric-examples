CREATE CONSTRAINT IF NOT EXISTS ON (n: `Customer`) ASSERT n.`customerID` IS UNIQUE;

LOAD CSV WITH HEADERS FROM 'file:///customers.csv' AS row
UNWIND $nodeRecords AS nodeRecord
MERGE (n: `Customer` { `customerID`: nodeRecord.`customerID` })
SET n.`name` = nodeRecord.`name`
RETURN n;