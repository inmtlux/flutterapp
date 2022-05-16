'use strict'

const bcrypt = require('bcryptjs');

var client = require("../database/db");
//sacar la base de datos
var db = client.db("flutterapp");

var controller = {
    //listar
    list: function(req,res){
        console.log("---------------");
        console.log("entrando a la funcion listar");
        db.collection("usuarios").find().toArray(
            (error, dataUsuarios)=>{
                if(error||! dataUsuarios){
                    console.log(error);
                    return res.status(404).send({
                        message: "no se encontraron los usuarios"
                    });
                }else{
                    return res.status(200).send({
                        status:"succees",
                        usuario: dataUsuarios
                    });
                }
            }
        );
    },
    find: function(req,res){
        console.log("----------");
        console.log("entrando a la funcion find");
        console.log("id"+ req.params.id);
        db.collection("usuarios").find({usuarioId: parseInt(req.params.id)}).toArray(
            (error, dataUsuarios)=>{
                if(error||! dataUsuarios){
                    return res.status(404).send({
                        message: "no se encontraron los usuarios"
                    });
                }else{
                    return res.status(200).send({
                        status:"succees",
                        usuario: dataUsuarios[0]
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
        if(req.body.usuarioId == "0"){//si es nuevo
            console.log("entrando a nuevo");
            db.collection("usuarios").count().then(
                countUsuarios =>{
                    let password = req.body.password;
                    const salt = bcrypt.genSaltSync(10);
                    password = bcrypt.hashSync(password,salt);
                    var usuario = {}
                    usuario.usuarioId = countUsuarios + 1;
                    usuario.nombApelli = req.body.nombApelli;
                    usuario.email = req.body.email;
                    usuario.password = password;
                    usuario.estado = true;
                    usuario.rol = "user_rol";
                    db.collection('usuarios').insertOne(usuario,
                        (error, result)=>{
                            if(error){
                                return res.status(404).send({
                                    message:"no se pudo regitrar el usuario"
                                });
                            }else{
                                return res.status(200).send({
                                    message: "success",
                                    usuario: result
                                });
                            }
                        }
                    );
                }
            );
        }else{//entrando a editar
            console.log("ENTRANDO A EDITAR");
            var usuario = {}
            usuario.usuarioId = parseInt(req.body.usuarioId);
            usuario.nombApelli = req.body.nombApelli;//descripcion
            usuario.email = req.body.email;//precio
            usuario.password = req.body.password;
            usuario.estado = true;
            usuario.rol = "user_rol";
            console.log(usuario);
            db.collection("usuarios").updateOne({ usuarioId: { $eq: parseInt(req.body.usuarioId)}},
                                                 {$set: usuario},
                (error, result)=>{
                if(error){
                    return res.status(404).send({
                        message:"no se pudo editar el usuario"
                    });
                }else{
                    return res.status(200).send({
                        message: "success",
                        usuario: result
                    });
                }
            }
            )
        }
    }
}

//exportando modulo
module.exports = controller;