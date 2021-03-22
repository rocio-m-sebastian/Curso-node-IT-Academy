// Nivell 1
// Exercici 1
let someoneNew = true;
const sayHi = new Promise((resolve, reject) => {
    if (someoneNew) {
      resolve('hi!');
    } else {
      reject('no one new');
  }
});

sayHi
  .then((successMessage) => console.log(successMessage))
  .catch( error => console.log(error) );

// Exercici 2
const saludar = (nombre) => console.log('Hola ' + nombre);

const procesarEntradaUsuario = (name, callback) => {
  callback(name);
}

procesarEntradaUsuario('Carol', saludar);

// Nivell 2
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

getEmpleado(1)
  .then((employyee) => console.log(employyee))
  .catch( error => console.log(error) );

// Exercici 2
const getSalario = (employee) => {
    const salary = salaries.find(x => x.id === employee.id);
    return new Promise((resolve, reject) => {
        if (salary) {
            resolve(salary);
        } else {
            reject('the employee does not exist');
        }
    })
};

const employee = {
    id: 1,
    name: 'Linux Torvalds'
};
getSalario(employee)
  .then((employee) => console.log(employee.salary))
  .catch( error => console.log(error) );

// Exercici 3
getEmpleado(1)
  .then(employee => getSalario(employee))
  .then((employee) => console.log(employee.salary));

// Nivell 3
// Exercici 3
getEmpleado(1)
  .then(employee => getSalario(employee))
  .then((employee) => console.log(employee.salary))
  .catch( error => console.log(error) );
