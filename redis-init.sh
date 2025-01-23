#!/bin/bash

# start the Redis server in the background
redis-server --daemonize yes

# wait for Redis server to start
sleep 5

QUOTES_FILE="/docker-entrypoint-initdb.d/quotes.json"

# import quotes from the quotes.json file into Redis
index=1
while IFS= read -r line; do
  # parse json fields using jq
  id=$(echo "$line" | jq -r '.id')
  text=$(echo "$line" | jq -r '.text')
  author=$(echo "$line" | jq -r '.author')
  genre=$(echo "$line" | jq -r '.genre')

  redis-cli HMSET "quote:$id" id "$id" text "$text" author "$author" genre "$genre"
  ((index++))
done < <(jq -c '.[]' "$QUOTES_FILE")

echo "Quotes have been successfully imported into Redis."

# keep the container running
tail -f /dev/null