// Exercici 1
const printName = (name) => {
    console.log(name);
};

printName('María');

// Nivell 2
// Exercici 1
// Exercici 2
const name = 'María';
const surname = 'Martín';
const printFullName = (n, s) => {
    const fullname = `${n} ${s}`;
    console.log(fullname);
};

printFullName(name, surname);

// Nivell 3
// Exercici 1
const function1 =
      function2 =
      function3 =
      function4 =
      function5 =
      function6 =
      function7 =
      function8 =
      function9 =
      function10  = () => {
    for(let i = 0; i < 10; i++) {
        console.log(i);
    }
}

const functions = [function1, function2, function3, function4, function5, function6, function7, function8, function9, function10];

for (i = 0; i < functions.length; i++) {
    functions[i]();
};

// Exercici 2
const printName2 = ((n) => {
    console.log(n);
})(name);

printName2;

