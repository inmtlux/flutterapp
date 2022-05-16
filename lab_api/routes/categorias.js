'use strict'

var express = require('express');
const {model} = require('mongoose');

var CategoriaController = require('../controller/categorias');

var router = express.Router();

//ruta productos
router.get('/categorias', CategoriaController.list);
router.get('/categorias/:id', CategoriaController.find);
router.post('/categorias/save', CategoriaController.save);
//falta buscar
//falta guardar

//exportar ruta
module.exports = router;