'use strict'

const bcrypt = require('bcryptjs');
const {response} = require('express');

var client = require("../database/db");
//sacar la base de datos
var db = client.db("flutterapp");

var controller = {
    login: async function (req, res=response) {

        const { email, password } = req.body;

        const usuario = await db.collection('usuarios').findOne({ email });
        try {
            if (!usuario) {
                return res.status(404).json({
                    msg: 'Usuario / password no es correcto - email'
                })
            }


            // verificar que el estado del usuario este activo
            if (!usuario.estado) {
                return res.status(400).json({
                    msg: 'Usuario / password / estodo no es correcto - estado: false'
                })
            }

            // verificar contraseña

            const validPassword = bcrypt.compareSync(password, usuario.password);
            if (!validPassword) {
                return res.status(400).json({
                    msg: 'Usuario / password no es correcto - password'
                })
            }


            res.json({
                usuario,
                msg: 'Inico de sesión'
            })


        } catch (error) {
            return res.status(500).json({
                msg: 'error en el login'
            })
        }
    }
}

module.exports = controller