const {Router} = require('express');

const router = Router();

const ReporteControllerU = require('../controller/reporte_U');

router.get('/reportes/usuariosCate', ReporteControllerU.ReporteUsuarios);
// EXPORTAR RUTA
module.exports = router;