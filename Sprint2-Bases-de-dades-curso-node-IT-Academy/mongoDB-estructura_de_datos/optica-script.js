use optica;
db.dropDatabase();
db.createCollection("proveedores");

const proveedor1 = {
    "nombre": "Alex",
    "dirección": {
        "calle": "carrer Palencia",
        "numero": 1,
        "piso": 1,
        "puerta": "A",
        "ciudad": "Barcelona",
        "cp": "11111",
        "pais": "España", 
    },
    "telf": "611111111",
    "fax": "111111111",
    "nif": "01111111",
};

const proveedor2 = {
    "nombre": "Anne",
    "dirección": {
        "calle": "carrer Aragó",
        "numero": 2,
        "piso": 2,
        "puerta": "B",
        "ciudad": "Barcelona",
        "cp": "22222",
        "pais": "España", 
    },
    "telf": "62222222",
    "fax": "22222222",
    "nif": "02222222",
};

db.proveedores.save(proveedor1);
db.proveedores.save(proveedor2);

db.createCollection("gafas");

const gafas1 = {
    "marca": "adidas",
    "graduacion": [1,1],
    "tipo": "flotante",
    "color": "verde",
    "color_vidrio": ["transparente", "transparente"],
    "precio": 150,
    "id_proveedor": ObjectId("608da2f496b529bca08e6b0f"),
};

const gafas2 = {
    "marca": "rayban",
    "graduacion": [2,1],
    "tipo": "pasta",
    "color": "azul",
    "color_vidrio": ["oscuro", "oscuro"],
    "precio": 250,
    "id_proveedor": ObjectId("608da33f96b529bca08e6b10"),
};

db.gafas.save(gafas1);
db.gafas.save(gafas2);

db.createCollection("vendedores");

const vendedor1 = {
    "nombre": "Carla",
}

const vendedor2 = {
    "nombre": "Kate",
}

db.vendedores.save(vendedor1);
db.vendedores.save(vendedor2);

db.createCollection("clientes");

const cliente1 = {
    "nombre": "Roland",
    "direccion": {
        "calle": "carrer Salamanca",
        "numero": 1,
        "piso": 1,
        "puerta": "A",
        "ciudad": "Barcelona",
        "cp": "00000",
        "pais": "España", 
    },
    "telf": "633333333",
    "email": "cliente1@email.com",
    "fecha_registro": new Date("01-01-2021"),
    "recomendador": "Clair",
    "compras": 
        [
            {
                "id_gafas": ObjectId("608e0feeaf8709d0675fb182"),
                "id_vendedor": ObjectId("608e1120af8709d0675fb184"),
            },
        ]
};

const cliente2 = {
    "nombre": "Roney",
    "direccion": {
        "calle": "carrer Badajoz",
        "numero": 2,
        "piso": 2,
        "puerta": "B",
        "ciudad": "Barcelona",
        "cp": "11111",
        "pais": "España", 
    },
    "telf": "644444444",
    "email": "cliente2@email.com",
    "fecha_registro": new Date("02-02-2021"),
    "compras": 
        [
            {
                "id_gafas": ObjectId("608e0fefaf8709d0675fb183"),
                "id_vendedor": ObjectId("608e1120af8709d0675fb184"),
            },
        ]
};

db.clientes.save(cliente1);
db.clientes.save(cliente2);
