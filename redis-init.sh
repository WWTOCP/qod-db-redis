#!/bin/bash

QUOTES_FILE="/data/quotes.json"

# import quotes from the quotes.json file into Redis
index=1
while IFS= read -r line; do
  # Use redis-cli to set each quote with a unique key
  redis-cli set "quote:$index" "$line"
  ((index++))
done < <(jq -c '.[]' "$QUOTES_FILE")

echo "Quotes have been successfully imported into Redis."