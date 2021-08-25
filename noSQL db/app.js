const express = require("express");
const mongoose = require("mongoose");
const { use } = require("./routers/aliens");
const url = "mongodb://localhost:27017/dfs";
const app = express();

mongoose.connect(url, { useNewUrlParser: true });
const con = mongoose.connection;
app.use(express.json());

con.on("open", function () {
  console.log("Connected...");
});
const alienRouter = require("./routers/aliens");
app.use("/aliens", alienRouter);

const port = 3000;
app.listen(port, () => {
  console.log(`Server Started on localhost:${port}`);
});
