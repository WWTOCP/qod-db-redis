const fs = require('fs');

// read quotes.json file
const quotes = JSON.parse(fs.readFileSync('/docker-entrypoint-initdb.d/quotes.json', 'utf8'));

// access desired database name from environment variable set by Dockerfile
const dbName = process.env.MONGO_INITDB_DATABASE;

// connect to database
const db = connect(`mongodb://localhost:27017/${dbName}`);

// create 'quotes' collection and insert entries
db.quotes.insertMany(quotes);