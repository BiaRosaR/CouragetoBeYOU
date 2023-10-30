var medidaModel = require("../models/medidaModel");


function chart1(req, res){
    medidaModel.chart1().then((resposta)=>{res.status(200).json({blusas:resposta})});
}

function chart2(req, res){
    medidaModel.chart2().then((resposta)=>{res.status(200).json({xadrez:resposta})});
}

function chart3(req, res){
    medidaModel.chart3().then((resposta)=>{res.status(200).json({sapatos:resposta})});
}

module.exports = {
    chart1,
    chart2,
    chart3
}