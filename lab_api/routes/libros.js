'use strict'

var express = require('express');
const {model} = require('mongoose');

var LibroController = require('../controller/libros');

var router = express.Router();

//ruta productos
router.get('/libros', LibroController.list);
router.get('/libros/:id', LibroController.find);
router.post('/libros/save', LibroController.save);
//falta buscar
//falta guardar

//exportar ruta
module.exports = router;