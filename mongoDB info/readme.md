# MongoDB for storing Data
## Current Structure
### bitcoin_test database
This is the database that we always connect to
### top100coins collection
This is the main, most important "collection"/table, that has a very large JSON, which contains the top 100 cryptocurrencies. You can see
an example JSON in this directory.
### Other collections/tables
MongoDB does not support joins, so there really is an insentive to clump your entries together and nest your JSONs.
However, making queries on these can be a pain, so I made some individual "collections" or tables, that have 
individual currency data. Included are the big boys: Bitcoin, Ethereum, Litecoin, Ripple, etc.



