'use strict'

var client = require("../database/db");
//sacar la base de datos
var db = client.db("flutterapp");

var controller = {
    //listar
    list: function(req,res){
        console.log("---------------");
        console.log("entrando a la funcion listar");
        db.collection("libros").find().toArray(
            (error, dataProductos)=>{
                if(error||! dataProductos){
                    console.log(error);
                    return res.status(404).send({
                        message: "no se encontraron los produ"
                    });
                }else{
                    return res.status(200).send({
                        status:"succees",
                        productos: dataProductos
                    });
                }
            }
        );
    },
    find: function(req,res){
        console.log("----------");
        console.log("entrando a la funcion find");
        console.log("id"+ req.params.id);
        db.collection("libros").find({productoId: parseInt(req.params.id)}).toArray(
            (error, dataProductos)=>{
                if(error||! dataProductos){
                    return res.status(404).send({
                        message: "no se encontraron los produ"
                    });
                }else{
                    return res.status(200).send({
                        status:"succees",
                        productos: dataProductos[0]
                    });
            }
        }
        );
    },
    //guardar
    save: function(req,res){
        console.log("----------");
        console.log("entrando a la funcion save");
        console.log(req.body);
        if(req.body.productoId == "0"){//si es nuevo
            console.log("entrando a nuevo");
            db.collection("libros").count().then(
                countProductos =>{
                    var producto = {}
                    producto.productoId = countProductos + 1;//producto
                    producto.categorias = req.body.categorias;
                    producto.descripcion = req.body.descripcion;//descripcion
                    producto.precio = req.body.precio;
                    prodcuto.autor = req.body.autor; //autor
                    producto.año_publicacion = req.body.año_publicacion//
                    db.collection('libros').insertOne(producto,
                        (error, result)=>{
                            if(error){
                                return res.status(404).send({
                                    message:"no se pudo regitrar el producto"
                                });
                            }else{
                                return res.status(200).send({
                                    message: "success",
                                    producto: result
                                });
                            }
                        }
                    );
                }
            );
        }else{//entrando a editar
            console.log("ENTRANDO A EDITAR");
            var producto = {}
            producto.productoId = parseInt(req.body.productoId);
            producto.descripcion = req.body.descripcion;//descripcion
            producto.precio = req.body.precio;//precio
            console.log(producto);
            db.collection("libros").updateOne({ productoId: { $eq: parseInt(req.body.productoId)}},
                                                 {$set: producto},
                (error, result)=>{
                if(error){
                    return res.status(404).send({
                        message:"no se pudo editar el producto"
                    });
                }else{
                    return res.status(200).send({
                        message: "success",
                        producto: result
                    });
                }
            }
            )
        }
    }
}

//exportando modulo
module.exports = controller;