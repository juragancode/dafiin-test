function cetakNama(nama) {
    return `Halo, nama saya ${nama}`;
}

const PI = 3.14;

const mahasiswa = {
    nama: 'Dafin Overclock',
    umur: 22,
    cetakMhs() {
        return `Halo, nama saya ${this.nama} dan umur saya ${this.umur} tahun.`;
    }
}

class Orang {
    constructor() {
        console.log('Objek orang telah dibuat');
    }
}

module.exports = {
    cn: cetakNama,
    pi: PI,
    mhs: mahasiswa,
    org: Orang,
}