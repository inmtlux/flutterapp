'use strict'

var client = require("../database/db");
//sacar la base de datos
var db = client.db("flutterapp");

var controller = {
    //listar
    list: function (req, res) {
        console.log("---------------");
        console.log("entrando a la funcion listar");
        db.collection("categorias").find().toArray(
            (error, dataCategorias) => {
                if (error || !dataCategorias) {
                    console.log(error);
                    return res.status(404).send({
                        message: "no se encontraron las categorias"
                    });
                } else {
                    return res.status(200).send({
                        status: "succees",
                        categorias: dataCategorias
                    });
                }
            }
        );
    },
    find: function (req, res) {
        console.log("----------");
        console.log("entrando a la funcion find");
        console.log("id" + req.params.id);
        db.collection("categorias").find({ categoriaId: parseInt(req.params.id) }).toArray(
            (error, dataCategorias) => {
                if (error || !dataCategorias) {
                    return res.status(404).send({
                        message: "no se encontraron las categorias"
                    });
                } else {
                    return res.status(200).send({
                        status: "succees",
                        categorias: dataCategorias[0]
                    });
                }
            }
        );
    },
    //guardar
    save: function (req, res) {
        console.log("----------");
        console.log("entrando a la funcion save");
        console.log(req.body);
        if (req.body.categoriaId == "0") {//si es nuevo
            console.log("entrando a nuevo");
            db.collection("categorias").count().then(
                countProductos => {
                    var categoria = {}
                    categoria.categoriaId = countProductos + 1;//categoria
                    categoria.descripcion = (req.body.descripcion).toUpperCase();//descripcion
                    categoria.cantidadlibros = req.body.cantidadlibros;//cantidad de libros
                    categoria.img = '';
                    //categoria.imagen = req.body.imagen;
                    categoria.categoria = req.body.categoria;
                    categoria.estado = req.body.estado;

                    db.collection('categorias').insertOne(categoria,
                        (error, result) => {
                            if (error) {
                                return res.status(404).send({
                                    message: "no se pudo regitrar el producto"
                                });
                            } else {
                                return res.status(200).send({
                                    message: "success",
                                    categoria
                                });
                            }
                        }
                    );
                }
            );
        } else {//entrando a editar
            console.log("ENTRANDO A EDITAR");
            var categoria = {}
            categoria.categoriaId = parseInt(req.body.categoriaId);
            categoria.descripcion = (req.body.descripcion).toUpperCase();//descripcion
            categoria.cantidadlibros = req.body.cantidadlibros;//cantidad de libros
            categoria.img = '';
            //categoria.imagen = req.body.imagen;
            categoria.categoria = req.body.categoria;
            categoria.estado = req.body.estado;

            console.log(categoria);
            db.collection("categorias").updateOne({ categoriaId: { $eq: parseInt(req.body.categoriaId) } },{new:true},
                { $set: categoria },
                (error, result) => {
                    if (error) {
                        return res.status(404).send({
                            message: "no se pudo editar el producto"
                        });
                    } else {
                        return res.status(200).send({
                            message: "success",
                            categoria
                        });
                    }
                }
            )
        }
    }
}

//exportando modulo
module.exports = controller;