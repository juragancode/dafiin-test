const express = require("express");
const expressLayouts = require("express-ejs-layouts");
const {
  loadContact,
  findContact,
  addContact,
  cekDuplikat,
  deleteContact,
  updateContacts,
} = require("./utils/contacts");
const { body, validationResult, check } = require("express-validator");
const session = require("express-session");
const cookieParser = require("cookie-parser");
const flash = require("connect-flash");

const app = express();
const port = 3000;

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
  const contacts = loadContact();

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

// Prosses delete contact
app.get("/contact/delete/:nama", (req, res) => {
  const contact = findContact(req.params.nama);
  // Jika kontak tidak ada
  if (!contact) {
    res.status(404);
    res.send("<h1>404</h1>");
  } else {
    deleteContact(req.params.nama);
    req.flash("msg", "Data berhasil dihapus");
    res.redirect("/contact");
  }
});

app.post(
  "/contact",
  [
    body("nama").custom((value) => {
      const duplikat = cekDuplikat(value);
      if (duplikat) {
        throw new Error("Contact telah terdaftar");
      }
      return true;
    }),
    check("email", "Email tidak valid").isEmail(),
    check("NoHandphone", "No Handphone tidak valid").isMobilePhone("id-ID"),
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
      addContact(req.body);
      req.flash("msg", "Data berhasil ditambahkan");
      res.redirect("/contact");
    }
  }
);
//form ubah contact
app.get("/contact/edit/:nama", (req, res) => {
  const contact = findContact(req.params.nama);
  res.render("edit-contact", {
    title: "Form Ubah Data Contact",
    layout: "layouts/main_layouts",
    contact,
  });
});

//proses ubah data
app.post(
  "/contact/update",
  [
    body("nama").custom((value, { req }) => {
      const duplikat = cekDuplikat(value);
      if (value !== req.body.oldNama && duplikat) {
        throw new Error("Contact telah terdaftar");
      }
      return true;
    }),
    check("email", "Email tidak valid").isEmail(),
    check("NoHandphone", "No Handphone tidak valid").isMobilePhone("id-ID"),
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
      updateContacts(req.body);
      req.flash("msg", "Data berhasil diubah");
      res.redirect("/contact");
    }
  }
);

// detail contact
app.get("/contact/:nama", (req, res) => {
  const contact = findContact(req.params.nama);

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
  console.log(`Example app listening at http://localhost:${port}`);
});
