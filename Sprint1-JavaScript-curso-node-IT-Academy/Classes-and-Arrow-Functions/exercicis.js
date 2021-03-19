// Nivell 1
// Exercici 1
const name = 'María';
const surname = 'Martín';

((n, s) => {
    const fullMme = `${n} ${s}`
    console.log(fullMme);
})(name, surname);

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
function User(first, last) {
  this.firstName = first;
  this.lastName = last;
};

const user1 = new User("María", "Martín");
const user2 = new User("Julia", "Martín");
