'use strict'

var client = require("../database/db");
//sacar la base de datos
var db = client.db("flutterapp");

var controller = {
    //listar
    list: function(req,res){
        console.log("---------------");
        console.log("entrando a la funcion listar");
        db.collection("cterror").find().toArray(
            (error, dataCterror)=>{
                if(error||! dataCterror){
                    console.log(error);
                    return res.status(404).send({
                        message: "no se encontraron los libros en esta categoría"
                    });
                }else{
                    return res.status(200).send({
                        status:"succees",
                        productos: dataCterror
                    });
                }
            }
        );
    },
    find: function(req,res){
        console.log("----------");
        console.log("entrando a la funcion find");
        console.log("id"+ req.params.id);
        db.collection("cterror").find({productoId: parseInt(req.params.id)}).toArray(
            (error, dataCterror)=>{
                if(error||! dataCterror){
                    return res.status(404).send({
                        message: "no se encontraron los libros en esta categoría"
                    });
                }else{
                    return res.status(200).send({
                        status:"succees",
                        productos: dataCterror[0]
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
            db.collection("cterror").count().then(
                countCterror =>{
                    var cterror = {}
                    cterror.productoId = countCterror + 1;//producto
                    cterror.descripcion = req.body.descripcion; //descripción
                    cterror.autor = req.body.autor; //autor
                    cterror.año_publicacion = req.body.año_publicacion; //año de publicación
                    db.collection('cterror').insertOne(cterror,
                        (error, result)=>{
                            if(error){
                                return res.status(404).send({
                                    message:"no se pudo regitrar el libro"
                                });
                            }else{
                                return res.status(200).send({
                                    message: "success",
                                    cterror: result
                                });
                            }
                        }
                    );
                }
            );
        }else{//entrando a editar
            console.log("ENTRANDO A EDITAR");
            var cterror = {}
            cterror.productoId = parseInt(req.body.productoId);
            cterror.descripcion = req.body.descripcion;//descripcion
            cterror.autor = req.body.autor; //autor
            cterror.año_publicacion = req.body.año_publicacion; // año de publicación
            console.log(cterror);
            db.collection("cterror").updateOne({ productoId: { $eq: parseInt(req.body.productoId)}},
                                                 {$set: cterror},
                (error, result)=>{
                if(error){
                    return res.status(404).send({
                        message:"no se pudo editar el producto"
                    });
                }else{
                    return res.status(200).send({
                        message: "success",
                        cterror: result
                    });
                }
            }
            )
        }
    }
}

//exportando modulo
module.exports = controller;