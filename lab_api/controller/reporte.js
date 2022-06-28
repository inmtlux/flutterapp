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

    //REPORTE DE CATEGORIAS
    ReporteCategorias: function(req,res){
        console.log("--------------------------");
        console.log("ENTRANDO A LA FUNCION REPORTE DE CATEGORIAS");
        // CONTABILIZA LAS CATEGORIAS POR CATEGORIA
        db.collection("categorias").aggregate([
            {$group:{_id:"$categoria",count:{$sum:1}}}
        ]).toArray(
            (error, dataCategorias) => {
                if(error || !dataCategorias){
                    return res.status(404).send({
                        message: "No se encontraron categorias",
                    })
                }else{
                    return res.status(200).send({
                        status:"success",
                        ReporteCategorias: dataCategorias
                    })
                }
            }
        );
    },

    //REPORTE DE USUARIOS


    //======= Aca agregan su controllador ====
    // EJM
    // categoriasReporte: (){
    // codigo para mandar respuesta
    //} 
}
module.exports = controller;