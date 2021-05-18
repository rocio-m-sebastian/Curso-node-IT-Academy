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

const getEmpleado = async(id) => {
    const employee = employees.find(x => x.id === id);
    if(employee) {
        console.log(employee);
        return employee;
    }
    else {
        throw new Error('no one with this id');
    }
};

const getSalario = async(employee) => {
    const e = salaries.find(x => x.id === employee.id);
    if (e) {
        console.log(e.salary);
        return e.salary;
    } else {
        throw new Error('the employee does not exist');
    }
};

getEmpleado(1);
getSalario({id:1, name: 'Linux Torvalds'});


// Exercici 2
async function init(id) {
    const em = await getEmpleado(id);
    const emSalary = await getSalario(em)
    return `${em.name} tiene un salario de ${emSalary}$`;
}

init(1).then( message => {
    console.log(message);
    return message;
})
.catch( error => {
    console.log('error :', error);
});

init(1);