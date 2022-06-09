const { Router } = require('express');
const { cargarArchivo, actualizarImagenCloudinary, mostrarImagen } = require('../controller/upload');
const router = Router();

// router.post('/',cargarArchivo);
router.put('/:coleccion/:id',actualizarImagenCloudinary);
router.get('/:coleccion/:id',mostrarImagen);

module.exports = router;