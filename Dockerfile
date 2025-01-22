FROM redis:7.4.2

# install jq
USER root
RUN apt-get update && \
    apt-get install -y jq && \
    rm -rf /var/lib/apt/lists/*

# copy init script into designated location from where 
# .sh and .js scripts will be automatically run during initialization
COPY redis-init.sh /docker-entrypoint-initdb.d/

# copy quotes to be inserted into Redis
COPY quotes.json /docker-entrypoint-initdb.d/

# set permissions to allow users in root group to access in built image
RUN chgrp -R 0 /docker-entrypoint-initdb.d && \
    chmod -R g=u /docker-entrypoint-initdb.d && \
    chmod +x /docker-entrypoint-initdb.d/redis-init.sh

# default port for Redis
EXPOSE 6379

# execute initialization script
CMD ["/docker-entrypoint-initdb.d/redis-init.sh"]