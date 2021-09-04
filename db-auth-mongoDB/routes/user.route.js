const express = require("express");
const router = express.Router();
const bcrypt = require("bcryptjs");
const User = require("../models/user.model");

router.post("/signup", async (req, res) => {
  try {
    if (req.body.password != null) {
      // Generate Salt
      const salt = await bcrypt.genSalt(10);
      const hashPassword = await bcrypt.hash(req.body.password, salt);
      if (req.body.email != null) {
        const user = await new User({
          email: req.body.email,
          password: hashPassword,
        });
        await user.save();
        //Return JSON to User object
        res.json({
          message: "Regeister Succeed",
          token: hashPassword,
        });
      } else {
        res.status(400).json({ message: "Email is required" });
      }
    } else {
      res.status(400).json({ message: "Password is required" });
    }
  } catch (err) {
    console.log("An Error occurred" + err.message);
  }
});

router.post("/signin", async (req, res) => {
  try {
    if (req.body.email != null) {
      const user = await User.findOne({
        email: req.body.email,
      });
      !user &&
        res
          .status(404)
          .json({ message: "User does not Exist, please Register" });

      const validPassword = await bcrypt.compare(
        req.body.password,
        user.password
      );
      !validPassword &&
        res
          .status(404)
          .json({ message: "Invalid credentials, check login details" });

      if (user != null) {
        res.json({ message: "Login Succeed", body: user });
      } else {
        res.status(400).json({ message: "Email is required" });
      }
    }
  } catch (e) {
    console.log("An Error occurred" + e.message);
  }
});

module.exports = router;
