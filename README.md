# Função R para Gerar Histograma

Este repositório contém uma função em R que gera um histograma e salva em um arquivo com nome aleatório.

## Função `gerar_histograma`

A função `gerar_histograma()` permite gerar histogramas e salvá-los em arquivos com nomes aleatórios. A função aceita os seguintes parâmetros:

- `dados`: Vetor de dados para gerar o histograma (opcional, padrão: dados normais aleatórios)
- `n`: Número de dados a serem gerados se o parâmetro `dados` não for fornecido (padrão: 1000)
- `titulo`: Título do histograma (padrão: "Histograma")
- `caminho_saida`: Caminho onde o arquivo será salvo (padrão: diretório atual ".")
- `extensao`: Extensão do arquivo de saída ("png", "pdf", "jpeg" ou "jpg", padrão: "png")

## Exemplo de uso

```R
# Carregar a função
source("gerar_histograma.R")

# Gerar histograma com dados aleatórios e salvar como PNG
caminho_arquivo <- gerar_histograma()

# Gerar histograma com dados específicos
dados <- rnorm(500, mean = 5, sd = 2)
caminho_arquivo <- gerar_histograma(dados = dados, titulo = "Meu Histograma", extensao = "pdf")

# Imprimir o caminho do arquivo gerado
print(paste("Histograma salvo em:", caminho_arquivo))
```

## Arquivos

- `gerar_histograma.R`: Contém a função principal
- `teste_histograma.R`: Script de exemplo com testes da função

## Formatos suportados

A função suporta os seguintes formatos de arquivo:
- PNG
- PDF
- JPEG
- JPG