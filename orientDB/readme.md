OrientDB
**********************************************************************************

1. How to install orientdb and orientdb-gremlin

you need to get the source code from github by the command "git clone"

And you need to check the sepcific version for your delevop enrivonment, 
here I choose the version 3.0.37 

you should check the version during installation by the command "git checkout -b version_that_you_install" 


2. How to load data into OrientDB(still cannot load totally so far)


First, you need to start the server of OrientDB by running the bash file "server.sh" 
under the bin directory of  orient-gremlin and create the database named "ldbcDatabase"

Then, modify the groovy file "loadData.groovy"

Next, run the "loadData.groovy" to import data to the database"ldbcDatabase"
