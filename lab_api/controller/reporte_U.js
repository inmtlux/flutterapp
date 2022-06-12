'use strict'

const { request } = require("express");
var client = require("../database/db");
//sacar la base de datos
var db = client.db("flutterapp");

const controller = {
    ReporteUsuarios: function(req,res){
        console.log("--------------------------");
        console.log("ENTRANDO A LA FUNCION REPORTE DE USUARIOS");
        // CONTABILIZA LAS CATEGORIAS POR CATEGORIA
        db.collection("usuarios").aggregate([
            {$group:{ _id:"$categoria", count: { $sum: 1 } } }
        ]).toArray(
            (error, dataUsuarios) => {
                if(error || !dataUsuarios){
                    return res.status(404).send({
                        message: "No se encontraron categorias",
                    })
                }else{
                    return res.status(200).send({
                        status:"success",
                        ReporteUsuarios: dataUsuarios
                    })
                }
            }
        );
    },
}
module.exports = controller;