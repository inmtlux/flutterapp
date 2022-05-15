'use stric'
//requerimientos
var express = require('express')
var bodyParser = require('body-parser')

//usando la dependencia express
var app = express();

//carga de archivos del rutas
var libros_routes = require('./routes/libros');
<<<<<<< HEAD
var cterror_routes = require('./routes/cterror');
=======
var usuario_routes = require('./routes/usuario');
>>>>>>> 08a7677ee7ac01b4bf695a504722aa0c177835b1

//midelaware
app.use(bodyParser.urlencoded({ extended: false}));
app.use(bodyParser.json());

//configuracion de caberas cors
app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Headers', 'Authorization, X-API-KEY, Origin, X-Requested-With,Content-Type, Accept, Access-Control-Allow-Request-Method');
    req.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, DELETE');
    res.header('Allow', 'GET, POST, OPTIONS, PUT, DELETE');
    next();
});
//reeescrbir rutas
app.use('/api/',libros_routes);
<<<<<<< HEAD
app.use('/api/',cterror_routes);
=======
app.use('/api/',usuario_routes);
>>>>>>> 08a7677ee7ac01b4bf695a504722aa0c177835b1
//exportar modulo

module.exports = app;