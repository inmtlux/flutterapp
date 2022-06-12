const {Router} = require('express');

const router = Router();

const ReporteController = require('../controller/reporte');

router.get('/reportes/usuariosActivos', ReporteController.ReporteUsuariosActivos);

//REPORTE CATEGORIA
router.get('/reportes/reporteCategorias', ReporteController.ReporteCategorias);

// Agregar mas reportes

// EXPORTAR RUTA
module.exports = router;