const { MongoClient } = require("mongodb");

async function main() {
  const uri =
    "mongodb+srv://Dafin:fajri2015@cluster0.7e5dt.mongodb.net/myFirstDatabase?retryWrites=true&w=majority";

  const client = new MongoClient(uri);
  try {
    await client.connect();

    await printCheapestSuburbs(client, "Australia", "Sydney", 10);
  } catch (err) {
    console.error(err.message);
  } finally {
    await client.close();
  }
}

main().catch(console.error);

async function printCheapestSuburbs(client, country, market, maxNumberToPrint) {
  const pipeline = [
    {
      $match: {
        bedrooms: 1,
        "address.country": country,
        "address.market": market,
        "address.suburb": {
          $exists: 1,
          $ne: "",
        },
        room_type: "Entire home/apt",
      },
    },
    {
      $group: {
        _id: "$address.suburb",
        averagePrice: {
          $avg: "$price",
        },
      },
    },
    {
      $sort: {
        averagePrice: 1,
      },
    },
    {
      $limit: maxNumberToPrint,
    },
  ];

  const aggCursor = client
    .db("sample_airbnb")
    .collection("listingsAndReviews")
    .aggregate(pipeline);

  await aggCursor.forEach((airbnbListing) => {
    console.log(`${airbnbListing._id}: ${airbnbListing.averagePrice}`);
  });
}
