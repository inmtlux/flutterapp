'use strict'
//requerimientos
require('dotenv').config();
var mongoose = require('mongoose');
var app = require('./app');

//puerto del servidor
var port = process.env.port || 8080;


mongoose.Promise = global.Promise;
mongoose.connect(process.env.MONGO_DB,
                { useNewUrlParser: true})
                .then(
                    ()=>{
                        console.log('La conexion es estable');
                        //crear el servidor
                        app.listen(port, ()=>{
                            console.log('El servidor http://localhost:8080 esta funcionando')
                        })
                    }
                )
                .catch(error => console.log(error));