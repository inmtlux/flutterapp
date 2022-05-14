'use strict'

var express = require('express');
const {model} = require('mongoose');

var ProductoController = require('../controller/producto');

var router = express.Router();

//ruta productos
router.get('/productos', ProductoController.list);
router.get('/productos/:id', ProductoController.find);
router.post('/productos/save', ProductoController.save);
//falta buscar
//falta guardar

//exportar ruta
module.exports = router;