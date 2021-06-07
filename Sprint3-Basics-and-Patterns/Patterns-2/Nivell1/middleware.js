// MIDDLEWARE CLASS
class Middleware {
    constructor() {
        this.middlewares = [];
    }

    use(fn) {
        this.middlewares.push(fn);
    }

    executeMiddleware(middlewares, data, next) {
        const f = (next, fn) => 
            v => {
                // collect next data
                fn(data, next)
            }
        ;
        const composition = middlewares.reduceRight(f, next);
        composition(data);
    }

    run(data) {
        this.executeMiddleware(this.middlewares, data, (info, next) => {
            console.log(result);
        });
    }
}

module.exports = Middleware;