// Nivell 1
// Exercici 1
let employees = [{
    id: 1,
    name: 'Linux Torvalds'
}, {
    id: 2,
    name: 'Bill Gates'
},{
    id: 3,
    name: 'Jeff Bezos'
}];
 
let salaries = [{
    id: 1,
    salary: 4000
}, {
    id: 2,
    salary: 1000
}, {
    id: 3,
    salary: 2000
}];

const getEmpleado = (id) => {
    const employee = employees.find(x => x.id === id);
    return new Promise((resolve, reject) => {
        if (employee) {
            resolve(employee);
        } else {
            reject('no one with this id');
        }
    })
};

const getSalario = (employee) => {
    const e = salaries.find(x => x.id === employee.id);
    return new Promise((resolve, reject) => {
        if (e) {
            resolve(e.salary);
        } else {
            reject('the employee does not exist');
        }
    })
};


// Exercici 2
async function init(id) {
    const em = await getEmpleado(id);
    const emSalary = await getSalario(em)
    console.log(emSalary);
}

init(1);

// Nivell 2
// Exercici 1
const sayHi = (name) => {
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
}

init('Pedro');

// Nivell 3
// Exercici 1
const sayHi = (name) => {
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
    try {
        const saludation = await sayHi(name);
        console.log(saludation);
    } catch(err) {
        console.log(err);
    }
}

init('Pedro');



