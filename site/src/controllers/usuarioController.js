var usuarioModel = require("../models/usuarioModel");
// var aquarioModel = require("../models/aquarioModel");

function autenticar(req, res) {
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;

    if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está indefinida!");
    } else {

        usuarioModel.autenticar(email, senha)
            .then(
                function (resultadoAutenticar) {
                    console.log(`\nResultados encontrados: ${resultadoAutenticar.length}`);
                    console.log(`Resultados: ${JSON.stringify(resultadoAutenticar)}`); // transforma JSON em String

                    if (resultadoAutenticar.length == 1) {
                        console.log(resultadoAutenticar);
                        res.json(resultadoAutenticar);
                        

                    } else if (resultadoAutenticar.length == 0) {
                        res.status(403).send("Email e/ou senha inválido(s)");
                    } else {
                        res.status(403).send("Mais de um usuário com o mesmo login e senha!");
                    }
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }

}

function cadastrar(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var nome = req.body.nomeServer;
    var email = req.body.emailServer;
    var sexo = req.body.sexoServer;
    var senha = req.body.senhaServer;

    // Faça as validações dos valores
    if (nome == undefined) {
        res.status(400).send("Seu nome está undefined!");
    } else if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está undefined!");
    } else {

        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        usuarioModel.cadastrar(nome, email, sexo, senha)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

function registrarPesquisa(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    /*QTDpecaAzul: qtd_PAzul,
                QTDpecaBranca:  qtd_PBranca,
                QTDpecaPreta: qtd_PPreta,
                xadrez: xadrez,
                sapato: sapato*/ 

    var resposta1 = req.body.QTDpecaAzul;
    var resposta2 = req.body.QTDpecaPreta;
    var resposta3 = req.body.QTDpecaBranca;
    var resposta4 = req.body.xadrez;
    var resposta5 = req.body.sapato;

    // Faça as validações dos valores
    if (resposta1 == undefined) {
        res.status(400).send("Sua quantidade de peças azuis está undefined!");
    } else if (resposta2 == undefined) {
        res.status(400).send("Sua quantidade de peças pretas está undefined!");
    } else if (resposta3 == undefined) {
        res.status(400).send("Sua quantidade de peças Brancas está undefined!");
    } else if (resposta4 == undefined) {
        res.status(400).send("Sua resposta sobre peças xadrez está undefined!");
    } else if (resposta5 == undefined) {
        res.status(400).send("Seu sapato selecionado está undefined!");
    } else {

        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        usuarioModel.registrarPesquisa(resposta1, resposta2, resposta3, resposta4, resposta5)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

module.exports = {
    autenticar,
    cadastrar,
    registrarPesquisa
}