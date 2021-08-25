const { MongoClient } = require("mongodb");

async function main() {
  const uri =
    "mongodb+srv://Dafin:fajri2015@cluster0.7e5dt.mongodb.net/myFirstDatabase?retryWrites=true&w=majority";

  const client = new MongoClient(uri);
  try {
    await client.connect();

    await deleteListingScrapedBeforeDate(client, new Date("2020-08-25"));
  } catch (err) {
    console.error(err.message);
  } finally {
    await client.close();
  }
}

main().catch(console.error);

async function deleteListingScrapedBeforeDate(client, date) {
  const result = await client
    .db("test")
    .collection("lovey")
    .deleteMany({ last_scraped: { $lt: date } });
  console.log(`${result.deletedCount} document(s) was/were deleted`);
}

async function deleteListingByName(client, nameOfListing) {
  const result = await client
    .db("test")
    .collection("lovey")
    .deleteOne({ name: nameOfListing });

  console.log(`${result.deletedCount} document(s) was/were deleted`);
}

async function updateAllListingsToHavePropertyTypes(client) {
  const result = await client
    .db("test")
    .collection("lovey")
    .updateMany(
      { property_type: { $exists: false } },
      { $set: { property_type: "Unknown" } }
    );
  console.log(`${result.matchedCount} document(s) matched the query criteria.`);
  console.log(`${result.modifiedCount} document(s) was/were updated.`);
}

async function upsertListingByName(client, nameOfListing, updatedListing) {
  const result = await client
    .db("test")
    .collection("lovey")
    .updateOne(
      { name: nameOfListing },
      { $set: updatedListing },
      { upsert: true }
    );
  console.log(`${result.matchedCount} document(s) matched the query criteria`);
  if (result.upsertedCount > 0) {
    console.log(`One document was inserted with the id ${result.upsertedId}`);
  } else {
    console.log(`${result.modifiedCount} documents was/were updated`);
  }
}

async function updateListingByName(client, nameOfListing, updatedListing) {
  const result = await client
    .db("test")
    .collection("lovey")
    .updateOne({ name: nameOfListing }, { $set: updatedListing });

  console.log(`${result.matchedCount} document(s) matched the query criteria`);
  console.log(`${result.modifiedCount} documents was/were updated`);
}

async function findListingsWithMinimumBedroomsBathroomsAndMostRecentReviews(
  client,
  {
    minimumNumberOfBedrooms = 0,
    minimumNumberOfBathrooms = 0,
    maximumNumberOfResults = Number.MAX_SAFE_INTEGER,
  } = {}
) {
  // See https://mongodb.github.io/node-mongodb-native/3.6/api/Collection.html#find for the find() docs
  const cursor = client
    .db("test")
    .collection("lovey")
    .find({
      bedrooms: { $gte: minimumNumberOfBedrooms },
      bathrooms: { $gte: minimumNumberOfBathrooms },
    })
    .sort({ last_review: -1 })
    .limit(maximumNumberOfResults);

  // Store the results in an array
  const results = await cursor.toArray();

  // Print the results
  if (results.length > 0) {
    console.log(
      `Found listing(s) with at least ${minimumNumberOfBedrooms} bedrooms and ${minimumNumberOfBathrooms} bathrooms:`
    );
    results.forEach((result, i) => {
      const date = new Date(result.last_review).toDateString();

      console.log();
      console.log(`${i + 1}. name: ${result.name}`);
      console.log(`   _id: ${result._id}`);
      console.log(`   bedrooms: ${result.bedrooms}`);
      console.log(`   bathrooms: ${result.bathrooms}`);
      console.log(`   most recent review date: ${date}`);
    });
  } else {
    console.log(
      `No listings found with at least ${minimumNumberOfBedrooms} bedrooms and ${minimumNumberOfBathrooms} bathrooms`
    );
  }
}

async function findOneListingByName(client, nameOfListing) {
  const result = await client
    .db("test")
    .collection("lovey")
    .findOne({ name: nameOfListing });

  if (result) {
    console.log(`Found a listing in the collection with name ${nameOfListing}`);
    console.log(result);
  } else {
    console.log(`No listing found with name ${nameOfListing}`);
  }
}

async function createMultipleListings(client, newListing) {
  const result = await client
    .db("test")
    .collection("lovey")
    .insertMany(newListing);

  console.log(
    `${result.insertedCount} new listing created with the following  id(s): `
  );
  console.log(result.insertedIds);
}

async function createListing(client, newListing) {
  const result = await client
    .db("test")
    .collection("lovey")
    .insertOne(newListing);

  console.log(
    `New listing created with the following id: ${result.insertedId}`
  );
}

async function listDatabases(client) {
  const databasesList = await client.db().admin().listDatabases();

  console.log("Databases: ");
  databasesList.databases.forEach((db) => {
    console.log(`- ${db.name}`);
  });
}
