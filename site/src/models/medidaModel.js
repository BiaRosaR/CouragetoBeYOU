var database = require("../database/config");


function chart1() {
    const instrucao = `SELECT * FROM vw_pesquisaBlusas;`;
    return database.executar(instrucao);
}

function chart2(){
    const instrucao = `SELECT * FROM vw_pequisasXadrez;`;
    return database.executar(instrucao);
}

function chart3(){
    const instrucao = `SELECT * FROM vw_preferenciaSapato;`;
    return database.executar(instrucao);
}


module.exports = {
    chart1,
    chart2,
    chart3
}