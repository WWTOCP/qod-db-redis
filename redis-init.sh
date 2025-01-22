#!/bin/bash

# start the Redis server in the background
redis-server --daemonize yes

# wait for Redis server to start
sleep 5

QUOTES_FILE="/docker-entrypoint-initdb.d/quotes.json"

# import quotes from the quotes.json file into Redis
index=1
while IFS= read -r line; do
  # Use redis-cli to set each quote with a unique key
  redis-cli set "quote:$index" "$line"
  ((index++))
done < <(jq -c '.[]' "$QUOTES_FILE")

echo "Quotes have been successfully imported into Redis."

# keep the container running
tail -f /dev/null