const { ObjectId } = require("bson");
const { MongoClient } = require("mongodb");
const { resourceLimits } = require("worker_threads");

const uri = "mongodb://127.0.0.1:27017";
const dbName = "do";
const client = new MongoClient(uri, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

client.connect((error, client) => {
  if (error) {
    return console.log("Koneksi gagal");
  }

  // pilih database
  const db = client.db(dbName);

  // tambah 1 data ke collection mahasiwa
  //   db.collection("mahasiswa").insertOne(
  //     {
  //       nama: "Hajri",
  //       email: "hajri@gmail.com",
  //     },
  //     (error, result) => {
  //       if (error) {
  //         return console.log("gagal menambahkan data");
  //       }

  //       console.log(result);
  //     }
  //   );

  // tambahkan banyak data
  //   db.collection("mahasiswa").insertMany(
  //     [
  //       {
  //         nama: "Hajri",
  //         email: "hajri@gmail.com",
  //       },
  //       { nama: "Afit", email: "afit@gmail.com" },
  //     ],
  //     (error, resulst) => {
  //       if (error) {
  //         return console.log("data gagal ditambahkan");
  //       }
  //       console.log(resulst);
  //     }
  //   );

  // menampilkan data
  //   console.log(
  //     db
  //       .collection("mahasiswa")
  //       .find()
  //       .toArray((error, result) => {
  //         console.log(result);
  //       })
  //   );

  // tampilkan data dengan kriteria
  //   console.log(
  //     db
  //       .collection("mahasiswa")
  //       .find({ _id: ObjectId("6111e89886affc55f0d64655") })
  //       .toArray((error, result) => {
  //         console.log(result);
  //       })
  //   );
  //update data
  //   const updatePromise = db.collection("mahasiswa").updateOne(
  //     {
  //       _id: ObjectId("6111e89886affc55f0d64655"),
  //     },
  //     {
  //       $set: {
  //         email: "dafin12@yahoo.com",
  //       },
  //     }
  //   );
  //   updatePromise
  //     .then((result) => {
  //       console.log(result);
  //     })
  //     .catch((error) => {
  //       console.log(error);
  //     });
  db.collection("mahasiswa")
    .deleteOne({
      _id: ObjectId("6111e89886affc55f0d64655"),
    })
    .then((result) => {
      console.log(result);
    })
    .catch((error) => {
      console.log(error);
    });
});
