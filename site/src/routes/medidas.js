var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");


router.get("/chart1", function (req, res) {
    medidaController.chart1(req, res);
})

router.get("/chart2", function (req, res) {
    medidaController.chart2(req, res);
})

router.get("/chart3", function (req, res) {
    medidaController.chart3(req, res);
})



module.exports = router;