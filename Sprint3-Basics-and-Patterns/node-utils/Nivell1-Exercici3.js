const fs = require('fs');

const read = (ruta, cb) => {
    fs.readFile(ruta, (err, data) => {
        if(err) {
            console.log('No se ha podido leer el archivo '. err);
        } else {
            cb(data.toString());
        };
    });
}

read(__dirname + '/archivo-leer.txt', console.log);