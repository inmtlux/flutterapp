'use strict'

var express = require('express');
const { check } = require('express-validator');
const {model} = require('mongoose');
const { validarCampos } = require('../middlewares/validar-campos');


var AuthController = require('../controller/auth');

var router = express.Router();

router.post('/auth', [
    check('email','El email no es valido').isEmail(),
    check('password','Contraseña no Valida').isLength({min:6}),
    validarCampos
],AuthController.login);

module.exports = router;