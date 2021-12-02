##Do the labelling

#The account info for the customer shard
MATCH (a:Address) SET a:CustomerShard;
MATCH (c:Customer) SET c:CustomerShard;
MATCH (e:Email) SET e:CustomerShard;
MATCH (p:Phone) SET p:CustomerShard;
MATCH (s:`Sort Code`) SET s:CustomerShard;
MATCH (n:Customer)-[:HAS_ACCOUNT]-(a:Account) SET a:CustomerShard RETURN count(a);

##4.4 syntax!
#Shard by month - should be 20599 for july
MATCH (fa:Account)-[:FROM_ACCOUNT]-(t:Transaction WHERE t.dateTime STARTS WITH "2021-07")-[:TO_ACCOUNT]-(ta:Account)
SET t:Shard7, fa:Shard7, ta:Shard7
RETURN COUNT(*);

#Shard by month - should be 22251 for Aug
MATCH (fa:Account)-[:FROM_ACCOUNT]-(t:Transaction WHERE t.dateTime STARTS WITH "2021-08")-[:TO_ACCOUNT]-(ta:Account)
SET t:Shard8, fa:Shard8, ta:Shard8
RETURN COUNT(*);

#Shard by month - should be 21735 for Sept
MATCH (fa:Account)-[:FROM_ACCOUNT]-(t:Transaction WHERE t.dateTime STARTS WITH "2021-09")-[:TO_ACCOUNT]-(ta:Account)
SET t:Shard9, fa:Shard9, ta:Shard9
RETURN COUNT(*);


##Perform the copy


MATCH (fa:Account)-[:FROM_ACCOUNT]-(t:Transaction)-[ta:TO_ACCOUNT] WHERE t.dateTime STARTS WITH "2021-07" 
RETURN COUNT(*);












#The following is JUST the transactions

#Shard by month - should be 20599 for july
MATCH (fa:Account)-[:FROM_ACCOUNT]-(t:Transaction)-[ta:TO_ACCOUNT] where t.dateTime starts with "2021-07" 
SET t:Shard07
return count(*);

##4.3 syntax
#Shard by month - should be 22251 for Aug
MATCH (t:Transaction) where t.dateTime starts with "2021-08" 
SET t:Shard8
return count(*);

#Shard by month - should be 21735 for Sept
MATCH (t:Transaction) where t.dateTime starts with "2021-09" 
SET t:Shard9
return count(*);

#Shard by month - should be 425 for Oct
MATCH (t:Transaction) where t.dateTime starts with "2021-10" 
SET t:Shard10
return count(*);