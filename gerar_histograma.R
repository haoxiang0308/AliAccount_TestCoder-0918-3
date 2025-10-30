# Função que gera um histograma e salva em um arquivo com nome aleatório
gerar_histograma <- function(dados = NULL, n = 1000, titulo = "Histograma", 
                            caminho_saida = ".", extensao = "png") {
  
  # Se não for fornecido um conjunto de dados, gerar dados aleatórios normais
  if (is.null(dados)) {
    dados <- rnorm(n)
  }
  
  # Gerar um nome de arquivo aleatório
  nome_arquivo <- paste(sample(c(letters, 0:9), 12, replace = TRUE), collapse = "")
  caminho_completo <- paste0(caminho_saida, "/", nome_arquivo, ".", extensao)
  
  # Salvar o histograma no formato especificado
  if (extensao == "png") {
    png(caminho_completo, width = 800, height = 600)
  } else if (extensao == "pdf") {
    pdf(caminho_completo, width = 8, height = 6)
  } else if (extensao == "jpeg" || extensao == "jpg") {
    jpeg(caminho_completo, width = 800, height = 600)
  } else {
    stop("Extensão não suportada. Use 'png', 'pdf', 'jpeg' ou 'jpg'.")
  }
  
  # Criar o histograma
  hist(dados, 
       main = titulo,
       xlab = "Valores",
       ylab = "Frequência",
       col = "lightblue",
       border = "black")
  
  # Fechar o dispositivo de gravação
  dev.off()
  
  # Retornar o nome do arquivo gerado
  return(caminho_completo)
}

# Exemplo de uso:
# caminho_arquivo <- gerar_histograma()
# print(paste("Histograma salvo em:", caminho_arquivo))