#The importer only works with text at present
#A/c no. can remain as is, so can date times you can match well on the string
#To find transactions by amount need them to be in floats not strings 

MATCH (t:Transaction)
SET t += {amount: toFloat(t.amount)}
return count(*)

#Confirm find a transaction 
MATCH (t:Transaction) where t.amount > 300 return count(*);