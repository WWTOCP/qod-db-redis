const fs = require('fs');

const quotes = JSON.parse(fs.readFileSync('/docker-entrypoint-initdb.d/quotes.json', 'utf8'));

const dbName = process.env.MONGO_INITDB_DATABASE;

const db = connect(`mongodb://localhost:27017/${dbName}`);

db.quotes.insertMany(quotes);
