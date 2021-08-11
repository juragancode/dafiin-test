const mongoose = require("mongoose");
mongoose.connect("mongodb://127.0.0.1:27017/do", {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

// // Tambahkan 1 data
// const contact1 = new Contact({
//   nama: "Dafin Overclock",
//   noHP: "087814137700",
//   email: "dafin_overclock@gmail.com",
// });
// // simpan ke collection
// contact1.save().then((contact) => console.log(contact));
