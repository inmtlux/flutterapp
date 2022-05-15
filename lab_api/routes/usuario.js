'use strict'

var express = require('express');
const {model} = require('mongoose');

var UsuarioController = require('../controller/usuario');

var router = express.Router();

//ruta productos
router.get('/usuarios', UsuarioController.list);
router.get('/usuarios/:id', UsuarioController.find);
router.post('/usuarios/save', UsuarioController.save);
//falta buscar
//falta guardar

//exportar ruta
module.exports = router;