
var client = require("../database/db");
//sacar la base de datos
var db = client.db("flutterapp");

const existeCategoria = async (name) => {
    
    
    const categoria = await db.collection('categorias').findOne({descripcion:(name).toUpperCase()});

    if( !categoria ){
        throw new Error(`La categoria ${name} no existe`);
    }
}

module.exports = {
    existeCategoria
}