const zlib = require('zlib');
const fs = require('fs');

const gzip = zlib.createGzip();
const read = fs.createReadStream(__dirname + '/archivo-leer.txt');
const write = fs.createWriteStream(__dirname + '/archivo-leer.txt.gz');
read.pipe(gzip).pipe(write);