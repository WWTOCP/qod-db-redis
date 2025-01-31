# qod-db
Quote of the Day database

### Ports
This deployment opens up database access for MongoDB on port `6379`. Please set the service for this deployment to use port 6379, which is also the default used by the qod-api deployment to access this database.

### Permission Configuration
In order to operate the container within OpenShift Container Platform, you will need to run `oc adm policy add-scc-to-user anyuid -z default` after specifying the namespace/project designated for the container.

### Notes
* Works with redis docker image
* Automatically populates database `1` with quotes
