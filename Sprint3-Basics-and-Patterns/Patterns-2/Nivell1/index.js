const Middleware = require('./Middleware');
const middleware = new Middleware();

function sumar(data) {
    result = data.n1 + data.n2;
    // console.log('suamar: ', result);
    return result;
}

function restar(data) {
    result = data.n1 - data.n2;
    // console.log('restar: ', result);
    return result;
}

function multiplicar(data) {
    result = data.n1 * data.n2;
    // console.log('multiplicar: ', result);
    return result;
}

middleware.use(function (info, next) {
    result = result ** 2;
    next();
});

middleware.use(function (info, next) {
    result = result ** 3;
    next();
});

middleware.use(function (info, next) {
    result = result / 2;
    next();
});

middleware.run(sumar({n1: 2, n2: 5}));
middleware.run(restar({n1: 2, n2: 5}));
middleware.run(multiplicar({n1: 2, n2: 5}));


