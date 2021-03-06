'use stric'
//requerimientos
var express = require('express')
var bodyParser = require('body-parser')
var fileUpload = require('express-fileupload');

//usando la dependencia express
var app = express();

//carga de archivos del rutas
var libros_routes = require('./routes/libros');
var usuario_routes = require('./routes/usuario');
var auth_routes = require('./routes/auth');
var categorias_routes = require('./routes/categorias');
var producto_routes = require("./routes/producto");
var upload_routes = require("./routes/upload");
var reportes_routes = require("./routes/reporte");
var reportesUsuario_routes = require("./routes/reporte_U");

//midelaware
app.use(bodyParser.urlencoded({ extended: false}));
app.use(bodyParser.json());
app.use(fileUpload({
    useTempFiles : true,
    tempFileDir : '/tmp/'
}));

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
app.use('/api/',usuario_routes);
app.use('/api/',auth_routes);
app.use('/api/',categorias_routes);
app.use("/api/", producto_routes);
app.use("/api/", reportes_routes);
app.use("/api/upload", upload_routes);
app.use("/api/", reportesUsuario_routes);

//exportar modulo

module.exports = app;