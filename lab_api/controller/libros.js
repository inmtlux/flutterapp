'use strict'

const { request } = require("express");
var client = require("../database/db");
//sacar la base de datos
var db = client.db("flutterapp");

var controller = {
    //listar
    list: function (req, res) {
        console.log("---------------");
        console.log("entrando a la funcion listar");
        const { desde, limite } = req.query;
       
        db.collection("libros").find()
        .skip(Number(desde))
        .limit(Number(limite)).toArray(
            (error, dataLibros) => {
                if (error || !dataLibros) {
                    console.log(error);
                    return res.status(404).send({
                        message: "no se encontraron los libros"
                    });
                } else {
                    return res.status(200).send({
                        status: "succees",
                        libro: dataLibros
                    });
                }
            }
        );
    },
    listPorCartegoria: function (req = request, res) {
        console.log("---------------");
        console.log("entrando a la funcion Listar por Categoria");
        const { categoria } = req.params;
        const { desde, limite} = req.query;

        db.collection("libros").find({ categoria: (categoria).toUpperCase()})
        .skip(Number(desde))
        .limit(Number(limite))
        .toArray(
            (error, dataLibros) => {
                if (error || !dataLibros) {
                    console.log(error);
                    return res.status(404).send({
                        message: "no se encontraron los libros"
                    });
                } else {
                    return res.status(200).send({
                        status: "succees",
                        libro: dataLibros
                    });
                }
            }
        );
    },

    find: function (req, res) {
        console.log("----------");
        console.log("entrando a la funcion find");
        console.log("id" + req.params.id);
        db.collection("libros").find({ libroId: parseInt(req.params.id) }).toArray(
            (error, dataLibros) => {
                if (error || !dataLibros) {
                    return res.status(404).send({
                        message: "no se encontraron los produ"
                    });
                } else {
                    return res.status(200).send({
                        status: "succees",
                        libro: dataLibros[0]
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
        if (req.body.libroId == "0") {//si es nuevo
            console.log("entrando a nuevo");
            db.collection("libros").count().then(
                countProductos => {
                    var libro = {}
                    libro.libroId = countProductos + 1;//producto
                    libro.categoria = (req.body.categoria).toUpperCase();
                    libro.descripcion = req.body.descripcion;//descripcion
                    libro.autor = req.body.autor; //autor
                    libro.img = (req.body.img)? req.body.img:"";

                    db.collection('libros').insertOne(libro,
                        (error, result) => {
                            if (error) {
                                return res.status(404).send({
                                    message: "no se pudo regitrar el producto"
                                });
                            } else {
                                return res.status(200).send({
                                    message: "success",
                                    libro
                                });
                            }
                        }
                    );
                }
            );
        } else {//entrando a editar
            console.log("ENTRANDO A EDITAR");
            var libro = {}
            libro.libroId = parseInt(req.body.libroId);//producto
            libro.categoria = (req.body.categoria).toUpperCase();
            libro.descripcion = req.body.descripcion;//descripcion
            libro.autor = req.body.autor; //autor
            //
            libro.img =(req.body.img)? req.body.img:"";
            console.log(libro);
            db.collection("libros").updateOne({ libroId: { $eq: parseInt(req.body.libroId) } },
                { $set: libro },
                (error, result) => {
                    if (error) {
                        return res.status(404).send({
                            message: "no se pudo editar el producto"
                        });
                    } else {
                        return res.status(200).send({
                            message: "success",
                            libro: result
                        });
                    }
                }
            )
        }
    }
}

//exportando modulo
module.exports = controller;