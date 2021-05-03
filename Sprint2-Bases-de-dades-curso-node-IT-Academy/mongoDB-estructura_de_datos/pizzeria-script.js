use pizzeria;
db.dropDatabase();
db.createCollection("productos");

const producto1 = {
    "tipo_hamburguesa": false,
    "tipo_bebida": false,
    "tipo_pizza": true,
    "nombre": "4 estaciones",
    "descripcion": "pizza 4 estaciones",
    "imagen": "images/img1.jpg",
    "precio": 20,
};

const producto2 = {
    "tipo_hamburguesa": true,
    "tipo_bebida": false,
    "tipo_pizza": false,
    "nombre": "ny",
    "descripcion": "ny burger",
    "imagen": "images/img2.jpg",
    "precio": 10,
};

db.productos.save(producto1);
db.productos.save(producto2);

db.createCollection("categorias");

const categiria1 = {
    "nombre": "categoría 1",
    "pizzas_id": [ObjectId("608eef2083347126e829081d")],
};

db.categorias.save(categiria1);

db.createCollection("empleados");

const empleado1 = {
    "nombre": "Alex",
    "apellidos": "Martín",
    "telf": "600000000",
    "nif": "70000000",
    "trabajo": "repartidor",
};

const empleado2 = {
    "nombre": "Moira",
    "apellidos": "Martín",
    "telf": "611111111",
    "nif": "71111111",
    "trabajo": "cocinero",
};

db.empleados.save(empleado1);
db.empleados.save(empleado2);

db.createCollection("establecimientos");

const establecimiento1 = {
    "direccion": "carrer Aragó, 15",
    "cp": "00000",
    "localidad": "Barcelona",
    "provincia": "Barcelona",
    "empleados_id": [ObjectId("608ef1e683347126e8290820")],
};

const establecimiento2 = {
    "direccion": "carrer Girona, 1",
    "cp": "00000",
    "localidad": "Barcelona",
    "provincia": "Barcelona",
    "empleados_id": [ObjectId("608ef1e783347126e8290821")],
};

db.establecimientos.save(establecimiento1);
db.establecimientos.save(establecimiento2);

db.createCollection("clientes");

const cliente1 = {
    "nombre": "Anna",
    "apellidos": "Rosse",
    "dirección": "carrer Pamplona, 25",
    "cp": "00000",
    "telf": "633333333",
    "provincia": {
        "_id" : 1,
        "nombre": "Barcelona",
    },  
    "localidad": {
        "_id" : 1,
        "nombre": "Barcelona",
    },
    "pedidos": [
        {
            "_id" : 1,
            "tipo entrega": "domicilio",
            "productos": [ObjectId("608eef2083347126e829081d")],
            "precioTotal": 20,
            "establecimiento_id": ObjectId("608ef3ae83347126e8290822"),
            "fecha_entrega": new Date("2021-01-01T17:00:00Z"),
            "empleado_id": ObjectId("608ef1e683347126e8290820"),
        },
    ]
};

const cliente2 = {
    "nombre": "Julia",
    "apellidos": "Pérez",
    "dirección": "carrer Pamplona, 1",
    "cp": "00000",
    "telf": "655555555",
    "provincia": {
        "_id" : 1,
        "nombre": "Barcelona",
    },  
    "localidad": {
        "_id" : 1,
        "nombre": "Barcelona",
    },
    "pedidos": [
        {
            "_id" : 2,
            "tipo entrega": "domicilio",
            "productos": [ObjectId("608eef9f83347126e829081e")],
            "precioTotal": 10,
            "establecimiento_id": ObjectId("608ef3ae83347126e8290822"),
            "fecha_entrega": new Date("2021-01-01T15:00:00Z"),
            "empleado_id": ObjectId("608ef1e683347126e8290820"),
        },
    ]
};

db.clientes.save(cliente1);
db.clientes.save(cliente2);

