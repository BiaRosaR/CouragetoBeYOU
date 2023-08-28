var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/ultimas/:idAquario", function (req, res) {
    medidaController.buscarUltimasMedidas(req, res);
});

router.get("/tempo-real/:idAquario", function (req, res) {
    medidaController.buscarMedidasEmTempoReal(req, res);
})

router.get("/chart1", function (req, res) {
    medidaController.chart1(req, res);
})

// router.get("/chart2", function (req, res) {
//     medidaController.chart2(req, res);
// })


module.exports = router;