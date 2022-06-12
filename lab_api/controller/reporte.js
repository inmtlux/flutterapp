'use strict'

const { request } = require("express");
var client = require("../database/db");
//sacar la base de datos
var db = client.db("flutterapp");

const controller = {
    ReporteUsuariosActivos: function(req,res){
        db.collection("usuarios").aggregate([
            {$group:{_id:"$estado",count:{$sum:1}}}
        ]).toArray(
            (error, usuariosReporte) => {
                if(error || !usuariosReporte){
                    return res.status(404).send({
                        message: "No se encontraron usuarios",
                    })
                }else{
                    return res.status(200).send({
                        status:"success",
                        usuarioActivo: usuariosReporte
                    })
                }
            }
        );
    },


    //======= Aca agregan su controllador ====
    // EJM
    // categoriasReporte: (){
    // codigo para mandar respuesta
    //} 
}
module.exports = controller;