FROM mongo:8.0.4

## set environment variables
ENV MONGO_INITDB_ROOT_USERNAME=user \
    MONGO_INITDB_ROOT_PASSWORD=pass \
    MONGO_INITDB_DATABASE=qod

# copy init script into designated location from where 
# .sh and .js scripts will be automatically run during initialization
COPY mongo-init.js /docker-entrypoint-initdb.d/

# copy quotes to be inserted into MongoDB collection
COPY quotes.json /docker-entrypoint-initdb.d/

# default port for Mongo
EXPOSE 27017