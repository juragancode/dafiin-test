const yargs = require("yargs");
const contacts = require("./contacts");

console.log(yargs.argv);

yargs.command({
    command: 'add',
    describe: 'Menambahkan Contact Baru',
    builder: {
        nama: {
            describe: "Nama Lengkap",
            demandOption: true,
            type: 'String',
        },
        email: {
            describe: "Email",
            demandOption: false,
            type: 'String',
        },
        noHP: {
            describe: "No Handphone",
            demandOption: true,
            type: 'String',
        }
    },
    handler(argv) {
        contacts.simpanContact(argv.nama, argv.email, argv.noHP);

    }
}).demandCommand();

// Menampilkan daftar nama dan noHP contact
yargs.command({
    command: 'list',
    describe: 'Menampilkan semua nama & no HP contact',
    handler() {
        contacts.listContact();
    },
})

yargs.command({
    command: 'detail',
    describe: 'Menampilkan detail sebuah contact berdasarkan nama',
    builder: {
        nama: {
            describe: "Nama Lengkap",
            demandOption: true,
            type: 'String',
        },
    },
    handler(argv) {
        contacts.detailContact(argv.nama);
    },
})
// Menghapus contact dengan nama
yargs.command({
    command: 'delete',
    describe: 'Menghapus contact berdasarkan nama',
    builder: {
        nama: {
            describe: "Nama Lengkap",
            demandOption: true,
            type: 'String',
        },
    },
    handler(argv) {
        contacts.deleteContact(argv.nama);
    },
})

yargs.parse();