const express = require("express");
const mongoose = require("mongoose");
const dotenv = require("dotenv");
const APIcontroller = require("./Models/ControllerAPI/apicontroller");
const { use } = require("./Models/ControllerAPI/apicontroller");

dotenv.config();
let app = null;
let port = null;
let mongo_URL = null;

const initVar = async () => {
  port = process.env.PORT;
  mongo_URL = process.env.MONGO_URL;
  app = express();
};

middleware = async () => {
  app.use(express.urlencoded({ extended: false }));
  app.use(express.json({ extended: false }));
  app.use("/", APIcontroller);
  app.use("/signin", APIcontroller);
  app.use("/signup", APIcontroller);
  app.use("/files", APIcontroller);
  app.use("/files/:filename", APIcontroller);
};

const connectDB = async () => {
  try {
    await mongoose.connect(mongo_URL, {
      useNewUrlParser: true,
      useUnifiedTopology: true,
      bufferCommands: false,
      autoIndex: false,
    });

    console.log("MongoDB have been connected");
  } catch (err) {
    console.log("Error connecting to MongoDB" + err);
  }
};

const ListenToPort = async () => {
  app.listen(port, async () => {
    console.log(`Connected to port : ${port}`);
  });
};

initVar().then(() => {
  ListenToPort().then(() => {
    middleware().then(() => {
      connectDB();
    });
  });
});
