//This contains the statements from the importer copied & pasted

CREATE CONSTRAINT IF NOT EXISTS ON (n: `Customer`) ASSERT n.`customerID` IS UNIQUE;

LOAD CSV WITH HEADERS FROM 'file:///customers.csv' AS row
UNWIND $nodeRecords AS nodeRecord
MERGE (n: `Customer` { `customerID`: nodeRecord.`customerID` })
SET n.`name` = nodeRecord.`name`
RETURN n;

CREATE CONSTRAINT IF NOT EXISTS ON (n: `Phone`) ASSERT n.`phoneNumber` IS UNIQUE;

UNWIND $nodeRecords AS nodeRecord
MERGE (n: `Phone` { `phoneNumber`: nodeRecord.`phoneNumber` })
RETURN n;

CREATE CONSTRAINT IF NOT EXISTS ON (n: `Email`) ASSERT n.`email` IS UNIQUE;

UNWIND $nodeRecords AS nodeRecord
MERGE (n: `Email` { `email`: nodeRecord.`email` })
RETURN n;

CREATE CONSTRAINT IF NOT EXISTS ON (n: `Address`) ASSERT n.`address` IS UNIQUE;

UNWIND $nodeRecords AS nodeRecord
MERGE (n: `Address` { `address`: nodeRecord.`address` })
RETURN n;

CREATE CONSTRAINT IF NOT EXISTS ON (n: `Account`) ASSERT n.`account` IS UNIQUE;

UNWIND $nodeRecords AS nodeRecord
MERGE (n: `Account` { `account`: nodeRecord.`account` })
RETURN n;

CREATE CONSTRAINT IF NOT EXISTS ON (n: `Account`) ASSERT n.`account` IS UNIQUE;

UNWIND $nodeRecords AS nodeRecord
MERGE (n: `Account` { `account`: nodeRecord.`fromAccount` })
RETURN n;

CREATE CONSTRAINT IF NOT EXISTS ON (n: `Transaction`) ASSERT n.`transactionID` IS UNIQUE;

UNWIND $nodeRecords AS nodeRecord
MERGE (n: `Transaction` { `transactionID`: nodeRecord.`transactionID` })
SET n.`amount` = nodeRecord.`amount`
SET n.`dateTime` = nodeRecord.`dateTime`
SET n.`currency` = nodeRecord.`currency`
RETURN n;

CREATE CONSTRAINT IF NOT EXISTS ON (n: `Account`) ASSERT n.`account` IS UNIQUE;

UNWIND $nodeRecords AS nodeRecord
MERGE (n: `Account` { `account`: nodeRecord.`toAccount` })
RETURN n;


CREATE CONSTRAINT IF NOT EXISTS ON (n: `Sort Code`) ASSERT n.`sortCode` IS UNIQUE;

UNWIND $nodeRecords AS nodeRecord
MERGE (n: `Sort Code` { `sortCode`: nodeRecord.`sortCode` })
RETURN n;

UNWIND $relRecords AS relRecord
MATCH (source: `Customer` { `customerID`: relRecord.`customerID` })
MATCH (target: `Phone` { `phoneNumber`: relRecord.`phoneNumber` })
MERGE (source)-[r: `HAS_PHONE`]->(target)
RETURN r;

UNWIND $relRecords AS relRecord
MATCH (source: `Customer` { `customerID`: relRecord.`customerID` })
MATCH (target: `Email` { `email`: relRecord.`email` })
MERGE (source)-[r: `HAS_EMAIL`]->(target)
RETURN r;

UNWIND $relRecords AS relRecord
MATCH (source: `Customer` { `customerID`: relRecord.`customerID` })
MATCH (target: `Address` { `address`: relRecord.`address` })
MERGE (source)-[r: `HAS_ADDRESS`]->(target)
RETURN r;

UNWIND $relRecords AS relRecord
MATCH (source: `Customer` { `customerID`: relRecord.`customerID` })
MATCH (target: `Account` { `account`: relRecord.`account` })
MERGE (source)-[r: `HAS_ACCOUNT`]->(target)
RETURN r;


UNWIND $relRecords AS relRecord
MATCH (source: `Account` { `account`: relRecord.`fromAccount` })
MATCH (target: `Transaction` { `transactionID`: relRecord.`transactionID` })
MERGE (source)-[r: `FROM_ACCOUNT`]->(target)
RETURN r;


UNWIND $relRecords AS relRecord
MATCH (source: `Transaction` { `transactionID`: relRecord.`transactionID` })
MATCH (target: `Account` { `account`: relRecord.`toAccount` })
MERGE (source)-[r: `TO_ACCOUNT`]->(target)
SET r.`toAccount` = relRecord.`toAccount`
RETURN r;


UNWIND $relRecords AS relRecord
MATCH (source: `Account` { `account`: relRecord.`account` })
MATCH (target: `Sort Code` { `sortCode`: relRecord.`sortCode` })
MERGE (source)-[r: `HAS_SORT_CODE`]->(target)
RETURN r;