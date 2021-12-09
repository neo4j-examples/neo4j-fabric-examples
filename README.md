# fabric for fraud
Following set of resources have been provided to help you get going with Fabric.

Based upon Financial Fraud use case for Trinity Bank (a simulated bank)
Fraud type: the fraudulent structuring of transactions aka smurfing

Shows you how to 
+ Run fabric and the database shards on docker - refer to the folder docker, or kubernetes with Minikube - refer to the folder kubernetes
+ The synthetic data set - refer to folder synthetic-data 
	- of 500 customers (customers.csv) and 3 months of transactions (transactions.csv, into one graph
+ How to Import
	- Either use http://data-importer.graphapp.io/
	- Or refer to folder import, and use import.cypher to populate the neo4j database with the set of commands that the data-importer generated
+ How to label by month, and then shard the data across 3 shards - refer to the folder shard-the-data
	1) run shard-the-dataset.cypher 
	2) copy-the-data-to-shards
	3) create-customer-shard-constraints (these commands are outputted when you copy-the-shard-data)
	4) create-transaction-shard-constraints
+ Perform sample queries using fabric - refer to the file Queries
+ Some basic Troubleshooting

# synthetic data generator (transaction-generator)
Has been provided in the form of a Jupyter Notebook.
It can be used to
+ Generate any number of Trinity bank customers - default is 500
+ Change the upper and lower limits for the random generator that creates transaction between bank a/c - default is 30 to 100
+ Change the % of Trinity account holders that make transactions with other Trinity a/cs
+ Change the upper limit of the no. of random transactions created between Trinity a/cs
+ Change the currency, default USD

Notes on the generator
+ Uses faker python module to generate the data
+ It is representative but not accurate data
+ for example Sort-code isnt used, names dont match email addresses

