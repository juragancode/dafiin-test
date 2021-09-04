const express = require("express");
const expressLayouts = require("express-ejs-layouts");
const { body, validationResult, check } = require("express-validator");
const methodOverride = require("method-override");
const session = require("express-session");
const cookieParser = require("cookie-parser");
const flash = require("connect-flash");

require("./utils/db");
const Contact = require("./model/contact");

const app = express();
const port = 3000;
//konfigurasi method override
app.use(methodOverride("_method"));
//set up engine
app.set("view engine", "ejs");
app.use(expressLayouts);
app.use(express.static("public"));
app.use(express.urlencoded({ extended: true }));

//Konfigurasi flash
app.use(cookieParser("secret"));
app.use(
  session({
    cookie: { maxAge: 6000 },
    secret: "secret",
    resave: true,
    saveUninitialized: true,
  })
);
app.use(flash());

// home page
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
// about
app.get("/about", (req, res) => {
  res.render("about", {
    layout: "layouts/main_layouts",
    title: "Halaman About",
  });
});
// contact
app.get("/contact", async (req, res) => {
  const contacts = await Contact.find();

  res.render("contact", {
    layout: "layouts/main_layouts",
    title: "Halaman Contact",
    contacts,
    msg: req.flash("msg"),
  });
});
// tambah contact
app.get("/contact/add", (req, res) => {
  res.render("add-contact", {
    title: "Form Tambah Data Contact",
    layout: "layouts/main_layouts",
  });
});
// Prosses tambah contact
app.post(
  "/contact",
  [
    body("nama").custom(async (value) => {
      const duplikat = await Contact.findOne({ nama: value });
      if (duplikat) {
        throw new Error("Contact telah terdaftar");
      }
      return true;
    }),
    check("email", "Email tidak valid").isEmail(),
    check("noHP", "No Handphone tidak valid").isMobilePhone("id-ID"),
  ],
  (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      res.render("add-contact", {
        title: "Form Tambah Data Contact",
        layout: "layouts/main_layouts",
        errors: errors.array(),
      });
    } else {
      Contact.insertMany(req.body, (error, result) => {
        req.flash("msg", "Data berhasil ditambahkan");
        res.redirect("/contact");
      });
    }
  }
);
// Proses hapus
app.delete("/contact", async (req, res) => {
  Contact.deleteOne({ nama: req.body.nama }).then((result) => {
    req.flash("msg", "Data berhasil dihapus");
    res.redirect("/contact");
  });
});
//form ubah contact
app.get("/contact/edit/:nama", async (req, res) => {
  const contact = await Contact.findOne({ _id: contact._id });
  res.render("edit-contact", {
    title: "Form Ubah Data Contact",
    layout: "layouts/main_layouts",
    contact,
  });
});
//proses ubah data
app.put(
  "/contact",
  [
    body("nama").custom(async (value, { req }) => {
      const duplikat = await Contact.findOne({ nama: value });
      if (value !== req.body.oldNama && duplikat) {
        throw new Error("Contact telah terdaftar");
      }
      return true;
    }),
    check("email", "Email tidak valid").isEmail(),
    check("noHP", "No Handphone tidak valid").isMobilePhone("id-ID"),
  ],
  (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      res.render("edit-contact", {
        title: "Form Ubah Data Contact",
        layout: "layouts/main_layouts",
        errors: errors.array(),
        contact: req.body,
      });
    } else {
      Contact.updateOne(
        { _id: req.body._id },
        {
          $set: {
            nama: req.body.nama,
            email: req.body.email,
            noHP: req.body.noHP,
          },
        }
      ).then((result) => {
        req.flash("msg", "Data berhasil diubah");
        res.redirect("/contact");
      });
    }
  }
);

// detail contact
app.get("/contact/:nama", async (req, res) => {
  const contact = await Contact.findOne({ nama: req.params.nama });
  res.render("detail", {
    title: "Halaman Detail Contact",
    layout: "layouts/main_layouts",
    contact,
  });
});

app.use((req, res) => {
  res.status(404);
  res.send("404");
});
app.listen(port, () => {
  console.log(`Mongo Contact App | listening at http://localhost:${port}`);
});
