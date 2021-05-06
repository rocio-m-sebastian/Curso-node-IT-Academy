const fs = require('fs');

const writeName = (ruta, contenido, cb) => {
    fs.writeFile(ruta, contenido, (err) => {
        if(err) {
            console.log('No se ha podido escribir el archivo '. err);
        } else {
            console.log('Se ha escrito el archivo');
        };
    });
}

writeName(__dirname + '/archivo.txt', writeName.name, console.log);