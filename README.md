# fabric for fraud
Following set of resources have been provided to help you get going with Fabric.

Based upon Financial Fraud use case for Trinity Bank (a simulated bank)
Fraud type: the fraudulent structuring of transactions aka smurfing

Shows you how to 
+ Run fabric and the database shards on docker or minikube
	 - refer to the folder docker
	 - or refer to folder kubernetes for doing it with Minikube (need to review instructions)
	 - at this point fabric proxy is ready BUT you cant query because the databases DONT exist
+ The synthetic data set - refer to folder synthetic-data 
	- of 500 customers (customers.csv) and 3 months of transactions (transactions.csv, into one graph
+ How to Import
	- Either use http://data-importer.graphapp.io/ to get the data into default neo4j database
	- Or refer to folder import, and use import.cypher to populate the neo4j database with the set of commands that the data-importer generated
+ How to label by month, and then shard the data across 3 shards - refer to the folder shard-the-data
	1) run shard-the-dataset.cypher 
	2) perform admin commands in the copy-the-data-to-shards AS user neo4j (dont use ROOT)
	3) create-customer-shard-constraints (these commands are outputted to console when you copy-the-shard-data)
	4) create-transaction-shard-constraints
+ Perform sample queries using fabric - refer to the file Queries
+ Some basic Troubleshooting if you have any problems

# synthetic data generator (transaction-generator)
Has been provided in the form of a Jupyter Notebook.
It can be used to
+ Generate any number of Trinity bank customers - default is 500
+ Change the upper and lower limits for the random generator that creates transaction between bank a/c - default is 30 to 100
+ Change the % of Trinity account holders that make transactions with other Trinity a/cs
+ Change the upper limit of the no. of random transactions created between Trinity a/cs
+ Change the currency, default USD

Generates the following files 
+ output/customers.csv
+ output/transactions.csv

Notes on the generator
+ Uses faker python module to generate the data
+ It is representative but not accurate data
+ for example Sort-code isnt used, names dont match email addresses
+ Does not generate structured transactions


# ToDO
+ Public version of the CL deck
+ More notes on running the K8s / Minikube
+ Create structured transactions
+ Create a query to find the fraud
+ More adv. cypher queries
	- Recomposing the graph
+ Demo use cases for fabric with Aura
	- federated Neo4j + Aura queries
	- E.g cut over from on prem to cloud (question in CL session)
	- use for migration
	- use for DR
+ Federated databases for fraud rings
	- Multi-bank system generator with stolen identities generator 
	- Fraud ring data set
	- Synthetic and stolen identities
+ Using GDS
+ Using Bloom
+ Getting ready for 5.0

