const chalk = require('chalk');
const fs = require('fs');
const validator = require('validator');


const dirPath = './data';
if (!fs.existsSync(dirPath)) {
    fs.mkdirSync(dirPath);
}

const dataPath = './data/contacts.json';
if (!fs.existsSync(dataPath)) {
    fs.writeFileSync(dataPath, '[]', 'utf-8');
}

const loadContact = () => {
    const file = fs.readFileSync('data/contacts.json', 'utf8');
    const contacts = JSON.parse(file);
    return contacts;
}

const simpanContact = (nama, email, noHP) => {
    const contact = {
        nama,
        email,
        noHP,
    };

    const contacts = loadContact();

    // Cek duplikat nama
    const duplikat = contacts.find((contact) => contact.nama === nama);
    if (duplikat) {
        console.log(chalk.red.inverse.bold('Contact sudah terdaftar, silakan input contact lain'));
        return false;
    }

    // Cek email dengan validator
    if (email) {
        if (!validator.default.isEmail(email)) {
            console.log(chalk.red.inverse.bold('Email tidak valid!'));
            return false;
        }
    }
    // Cek NoHP dengan Validator
    if (!validator.default.isMobilePhone(noHP, 'id-ID')) {
        console.log(chalk.red.inverse.bold('No Handphone tidak valid!'));
        return false;
    }

    contacts.push(contact);
    fs.writeFileSync('data/contacts.json', JSON.stringify(contacts));
    console.log(chalk.green.inverse.bold('Terimakasih anda sudah memasukkan data'));

};

const listContact = () => {
    const contacts = loadContact();
    contacts.forEach((contact, i) => {
        console.log(`${i + 1}. ${contact.nama} - ${contact.noHP}`);
    });
};

const detailContact = (nama) => {
    const contacts = loadContact();
    const contact = contacts.find((contact) => contact.nama.toLowerCase() === nama.toLowerCase());
    if (!contact) {
        console.log(chalk.red.inverse.bold(`${nama} tidak terdaftar`));
        return false;
    }
    console.log(chalk.cyan.inverse.bold(contact.nama));
    console.log(contact.noHP);
    if (contact.email) {

        console.log(contact.email);
    }
};

const deleteContact = (nama) => {
    const contacts = loadContact();
    const newContacts = contacts.filter((contact) => contact.nama.toLowerCase() !== nama.toLowerCase());
    if (contacts.length === newContacts.length) {
        console.log(chalk.red.inverse.bold(`${nama} tidak terdaftar`));
        return false;
    }
    fs.writeFileSync('data/contacts.json', JSON.stringify(newContacts));
    console.log(chalk.green.inverse.bold(`Contact data ${nama} telah dihapus`));
}

module.exports = {
    simpanContact,
    listContact,
    detailContact,
    deleteContact,
};