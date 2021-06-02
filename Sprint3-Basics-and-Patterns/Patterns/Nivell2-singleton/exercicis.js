// - Exercici 1 - Singleton

// juego
// jugador
// marcador --> singleton
// ganador

class Juego {
    constructor(jugadores) {
        this.jugadores = jugadores;
        this.counter = new Marcador(jugadores);
    }

    createCounter() {
        console.log('creamos el marcador');
        console.log(this.counter);
        
        this.jugadores.map((jugador, i) => {
            // console.log(this.jugadores[i].name);
            // console.log(this.jugadores[i].points);
            // console.log(this.counter.jugadores[i].countElement);
            // console.log(jugador.name);
        });

        this.counter.increasePoints();
    }
}

class Marcador {
    constructor(jugadores) {
        this.jugadores = jugadores;
        this.jugadores.map(
            (jugador, i) => {
                this.jugadores[i].btnElement.addEventListener('click', this.increasePoints);
            }
        );

        if( typeof Marcador.instance === 'object') {
            return marcador.instace;
        }

        Marcador.instance = this;
        return this;
    }

    increasePoints = () => {
        this.jugadores.map((jugador, i) => {
            this.jugadores[i].points = this.jugadores[i].points + 1;
            // this.updatePoints();
            this.jugadores[i].countElement.textContent = this.jugadores[i].points;
        });
    }

    updatePoints (jugador, i) {
        console.log(this.jugadores[i]);
    }
}

class Jugador {
    // points = 0;

    constructor(counterElement, id, name) {
        this.id = id;
        this.name = name;
        this.countElement = counterElement.querySelector('.jugador__puntos');
        this.btnElement = counterElement.querySelector('.js-btn');
        this.points = parseInt(this.countElement.textContent);
        // this.btnElement.addEventListener('click', () => { console.log(Juego.counter.increasePoints) });
    }

    /* increasePoints = () => {
        this.points = this.points + 1;
        this.updatePoints();
    }

    updatePoints = () => {
        this.countElement.textContent = this.points;
        console.log(this);
    } */
}


const jugador1 = new Jugador(document.querySelector('.jugador1'), 1, 'jhon');
const jugador2 = new Jugador(document.querySelector('.jugador2'), 2, 'kate');
const jugador3 = new Jugador(document.querySelector('.jugador3'), 3, 'kate');
const juego1 = new Juego( [jugador1, jugador2, jugador3]  );
console.log(juego1);
juego1.createCounter();

// const marcador = new Marcador([new Jugador(document.querySelector('.jugador1'), 1, 'jhon'), new Jugador(document.querySelector('.jugador2'), 2, 'kate'), new Jugador(document.querySelector('.jugador3'), 3, 'kate')]);
// marcador.showPoints();
// console.log(marcador);