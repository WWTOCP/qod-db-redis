var dbName = process.env.MONGO_INITDB_DATABASE

var db = db.getSiblingDB(dbName);

var quotes = cat('/docker-entrypoint-initdb.d/quotes.json');

var quotesArray = JSON.parse(quotes);

db.quotes.insertMany(quotesArray);