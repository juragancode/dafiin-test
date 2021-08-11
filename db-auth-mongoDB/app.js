const express = require("express");
const app = express();
const port = 8080 || process.env.PORT;
const cors = require("cors");

require("./utils/db");

app.use(cors());
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.use("/", require("./routes/user.route"));

app.listen(port, () => {
  console.log(`Running on ${port}`);
});
