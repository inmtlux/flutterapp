'use strict'

var express = require('express');
var {check} = require('express-validator');
const { validarCampos } = require('../middlewares/validar-campos');

var LibroController = require('../controller/libros');
const { existeCategoria } = require('../helpers/db-validator');

var router = express.Router();

//ruta libros
router.get('/libros', LibroController.list);

router.get('/libros/:categoria',[
    check('categoria').custom(existeCategoria),
    validarCampos
],LibroController.listPorCartegoria);

router.get('/libros/:id',[
    check('id','El id debe ser un número').isNumeric(),
    validarCampos
], LibroController.find);

router.post('/libros/save', [
    check('libroId','El id debe ser un numero').isNumeric(),
    check('categoria','La categoria es obligatoria').notEmpty(),
    check('categoria').custom(existeCategoria),
    check('descripcion','La descripcion es obligatoria').notEmpty(),

    validarCampos
],LibroController.save);

//exportar ruta
module.exports = router;