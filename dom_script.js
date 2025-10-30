// Script para manipular o DOM e alterar o texto de um elemento
function alterarTextoDoElemento() {
    // Seleciona um elemento pelo ID (você pode alterar conforme necessário)
    const elemento = document.getElementById('texto-alterar');
    
    if (elemento) {
        // Altera o texto do elemento
        elemento.textContent = 'Texto alterado com sucesso!';
        console.log('Texto do elemento alterado:', elemento.textContent);
    } else {
        console.log('Elemento com ID "texto-alterar" não encontrado.');
    }
}

// Executa a função quando o DOM estiver completamente carregado
document.addEventListener('DOMContentLoaded', alterarTextoDoElemento);

// Exporta a função para permitir testes ou uso em outros contextos, se necessário
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { alterarTextoDoElemento };
}