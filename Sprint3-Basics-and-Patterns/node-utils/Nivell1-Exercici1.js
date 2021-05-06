const imprimirMsg = (msg) => {
    setInterval((msg) => {
        console.log(msg);
    },
    1000, msg);
};

imprimirMsg('mensaje!!!');