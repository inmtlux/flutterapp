'use strict'

var express = require('express');
const {model} = require('mongoose');

var CterrorController = require('../controller/cterror');

var router = express.Router();

//ruta productos
router.get('/cterror', CterrorController.list);
router.get('/cterror/:id', CterrorController.find);
router.post('/cterror/save', CterrorController.save);
//falta buscar
//falta guardar

//exportar ruta
module.exports = router;