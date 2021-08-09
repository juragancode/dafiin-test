const express = require("express");
const expressLayouts = require("express-ejs-layouts");
const morgan = require("morgan");
const app = express();
const port = 3000;

app.set("view engine", "ejs");
app.use(expressLayouts);
app.use(morgan("dev"));

app.use(express.static("public"));

app.use((req, res, next) => {
  console.log("Time:", Date.now());
  next();
});

app.get("/", (req, res) => {
  const mahasiswa = [
    {
      nama: "Dafin",
      email: "j1b115010@mhs.ulm.ac.id",
    },
    {
      nama: "Gajri",
      email: "j1b116012@mhs.ulm.ac.id",
    },
    {
      nama: "Wawan",
      email: "j1b111201 @mhs.ulm.ac.id",
    },
  ];
  res.render("index", {
    nama: "Dafin",
    title: "Home Page",
    mahasiswa,
    layout: "layouts/main_layouts",
  });
});

app.get("/about", (req, res) => {
  res.render("about", {
    layout: "layouts/main_layouts",
    title: "Halaman About",
  });
});

app.get("/contact", (req, res) => {
  res.render("contact", {
    layout: "layouts/main_layouts",
    title: "Halaman Contact",
  });
});

app.get("/product/:id", (req, res) => {
  res.send(
    `Product ID : ${req.params.id} <br> Category : ${req.query.category}`
  );
});

app.use((req, res) => {
  res.status(404);
  res.send("404");
});
app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});
