'use strict'

var express = require('express');
const {model} = require('mongoose');

var LibrosController = require('../controller/libros');

var router = express.Router();

//ruta productos
router.get('/libros', LibrosController.list);
router.get('/libros/:id', LibrosController.find);
router.post('/libros/save', LibrosController.save);
//falta buscar
//falta guardar

//exportar ruta
module.exports = router;