# qod-db
Quote of the Day database

### Ports
This deployment opens up database access for MongoDB on port `27017`. Please set the service for this deploymemt to use port 3306, which is also the default used by the qod-api deployment to access this database.

### Notes
* Works with mongo docker image
* Automatically creates QOD db and populates it with quotes collection
* No need of higher privileges (eg: anyuid) to run in openshift