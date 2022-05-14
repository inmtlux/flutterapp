'use stric'
//requerimientos
var express = require('express')
var bodyParser = require('body-parser')

//usando la dependencia express
var app = express();

//carga de archivos del rutas
var producto_routes = require('./routes/producto');

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
app.use('/api/',producto_routes);
//exportar modulo

module.exports = app;