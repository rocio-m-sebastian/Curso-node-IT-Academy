// Nivell 1
// Exercici 1
const num1 = 5;
const num2 = 6;

((n1, n2) => {
    const suma = n1 + n2;
    console.log(suma);
})(num1, num2);

// Nivell 2
// Exercici 1
const createObject = (name) => {
  const obj = {
    name:  name,
  };
  
  return obj;
}

createObject(name);

// Exercici 2
class Player {
  constructor (nombre) {
    this.nombre = nombre;;
  }
  
  decirNombre() {
    console.log(this.nombre);
  }
}

const player = new Player(name);
player.decirNombre();

// Nivell 3
// Exercici 1
let User = class User {
  constructor(first, last) {
    this.firstName = first;
    this.lastName = last;
  }
};

const user1 = new User("María", "Martín");
const user2 = new User("Julia", "Martín");
