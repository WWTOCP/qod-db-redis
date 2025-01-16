# qod-db
Quote of the Day database

### Ports
This deployment opens up database access for MongoDB on port `27017`. Please set the service for this deploymemt to use port 27017, which is also the default used by the qod-api deployment to access this database.

### Permission Configuration
In order to operate the container within OpenShift Container Platform, you will need to run `oc adm policy adm-scc-to-user anyuid -z default` after specifying the namespace/project designated for the container.

### Notes
* Works with mongo docker image
* Automatically creates QOD db and populates it with quotes collection