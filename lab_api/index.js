'use strict'
//requerimientos
var mongoose = require('mongoose');
var app = require('./app');

//puerto del servidor
var port = process.env.port || 3999;


mongoose.Promise = global.Promise;
mongoose.connect('mongodb+srv://user_node:BYxxFcvHxYohErgu@miclustercafe.kgjo7.mongodb.net/myFirstDatabase?retryWrites=true&w=majority',
                { useNewUrlParser: true})
                .then(
                    ()=>{
                        console.log('La conexion es estable');
                        //crear el servidor
                        app.listen(port, ()=>{
                            console.log('El servidor http://localhost:3999 esta funcionando')
                        })
                    }
                )
                .catch(error => console.log(error));