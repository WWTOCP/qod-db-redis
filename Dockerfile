FROM mongo:latest

ENV MONGO_INITDB_ROOT_USERNAME=user \
    MONGO_INITDB_ROOT_PASSWORD=pass \
    MONGO_INITDB_DATABASE=qod

COPY mongo-init.js /docker-entrypoint-initdb.d/
COPY quotes.json /docker-entrypoint-initdb.d/

EXPOSE 27017