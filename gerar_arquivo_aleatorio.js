const fs = require('fs');
const path = require('path');

// Função para gerar um nome de arquivo aleatório
function gerarNomeAleatorio() {
    const caracteres = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    let nome = '';
    for (let i = 0; i < 10; i++) {
        nome += caracteres.charAt(Math.floor(Math.random() * caracteres.length));
    }
    return nome;
}

// Lê o conteúdo do script DOM
const conteudoScript = fs.readFileSync('./dom_script.js', 'utf8');

// Gera um nome aleatório e adiciona a extensão .js
const nomeAleatorio = gerarNomeAleatorio() + '.js';

// Caminho completo para o novo arquivo
const caminhoNovoArquivo = path.join('./', nomeAleatorio);

// Escreve o conteúdo no novo arquivo
fs.writeFileSync(caminhoNovoArquivo, conteudoScript);

console.log(`Script DOM salvo em: ${caminhoNovoArquivo}`);