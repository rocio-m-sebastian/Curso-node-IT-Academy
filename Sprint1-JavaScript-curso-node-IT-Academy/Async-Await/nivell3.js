// Nivell 3
// Exercici 1
const sayHi2 = (name) => {
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

async function init2(name) {
    try {
        const saludation = await sayHi2(name);
        console.log(saludation);
    } catch(err) {
        console.log(err);
    }
}

init2('Pedro');