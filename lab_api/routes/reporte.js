const {Router} = require('express');

const router = Router();

const ReporteController = require('../controller/reporte');

router.get('/reportes/usuariosActivos', ReporteController.ReporteUsuariosActivos);
// Agregar mas reportes


module.exports = router;