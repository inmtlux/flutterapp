'use strict'

var express = require('express');
const { check } = require('express-validator');
const {model} = require('mongoose');

var UsuarioController = require('../controller/usuario');
const { validarCampos } = require('../middlewares/validar-campos');

var router = express.Router();

//ruta productos
router.get('/usuarios', UsuarioController.list);

router.get('/usuarios/:id',UsuarioController.find);

router.post('/usuarios/save', [
    check('usuarioId','Ingrese número').isNumeric(),
    check('nombre','El nombre es obligatorio').notEmpty(),
    check('email','El email no es valido').isEmail(),
    check('password','Contraseña no Valida').isLength({min:6}),
    validarCampos
],UsuarioController.save);
//falta buscar
//falta guardar

//exportar ruta
module.exports = router;