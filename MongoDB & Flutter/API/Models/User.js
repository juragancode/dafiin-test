const mongoose = require("mongoose");

//Create user model
const userSchema = new mongoose.Schema(
  {
    name: { type: String },
    email: { type: String, unique: true, required: true },
    password: { type: String, required: true },
    profilePicture: { type: String, default: "" },
    coverPhoto: { type: String, default: "" },
    following: { type: Array, default: [] },
    followers: { type: Array, default: [] },
  },
  { timestamps: true }
);

const User = mongoose.model("MyUser", userSchema);
module.exports = User;
