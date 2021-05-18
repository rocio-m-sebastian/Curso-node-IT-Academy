// Nivell 2
// Exercici 1
function sayHi(name) {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            if (name) {
                resolve(`Hola ${name}`);
            } else {
                reject('Algo salió mal...');
            }
        }, 2000);
    })
}

async function init(name) {
    const saludation = await sayHi(name);
    console.log(saludation);
    return saludation;
}

init('Pedro');