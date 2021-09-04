const { MongoClient } = require("mongodb");

async function main() {
  const uri =
    "mongodb+srv://Dafin:fajri2015@cluster0.7e5dt.mongodb.net/myFirstDatabase?retryWrites=true&w=majority";

  const client = new MongoClient(uri);
  try {
    await client.connect();

    await createMultipleUsers(client, [
      {
        email: "leslie@example.com",
        name: "Leslie Yepp",
      },
      {
        email: "april@example.com",
        name: "April Ludfence",
      },
      {
        email: "tom@example.com",
        name: "Tom Haverdodge",
      },
    ]);

    const createIndexResults = await client
      .db("sample_airbnb")
      .collection("users")
      .createIndex({ email: 1 }, { unique: true });
    console.log(`Index successfully created: ${createIndexResults}`);
  } finally {
    await client.close();
  }
}
main().catch(console.error);

async function createMultipleUsers(client, newUsers) {
  const result = await client
    .db("sample_airbnb")
    .collection("users")
    .insertMany(newUsers);

  console.log(
    `${result.insertedCount} new user(s) created with the following id(s):`
  );
  console.log(result.insertedIds);
}
