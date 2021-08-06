var validator = require('validator');
var chalk = require('chalk');


// console.log(validator.default.isEmail('arrhenius12@gmail.com'));
// console.log(validator.default.isMobilePhone('087814017330', 'id-ID'));
// console.log(validator.default.isNumeric('087814017330'));

console.log(chalk.bold.blue('Hello Wajenk!'));
const pesan = chalk`{red.bgGreen.bold Saya Dafin,} {blue.italic.bgWhite umur 24 tahun.} {yellow.bgBlue Saya seorang programer pemula}`;
console.log(pesan);