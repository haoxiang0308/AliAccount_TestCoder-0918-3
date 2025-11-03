# Função em R que gera um histograma e salva em um arquivo com nome aleatório
generate_and_save_histogram <- function(data = NULL, n = 100, bins = 30, format = "png", width = 800, height = 600) {
  # Se não for fornecido nenhum conjunto de dados, gerar dados aleatórios normais
  if (is.null(data)) {
    data <- rnorm(n)
  }
  
  # Gerar um nome de arquivo aleatório
  random_string <- paste(sample(c(letters, LETTERS, 0:9), 10, replace = TRUE), collapse = "")
  filename <- paste0(random_string, ".", format)
  
  # Abrir dispositivo gráfico de acordo com o formato especificado
  if (format == "png") {
    png(filename, width = width, height = height)
  } else if (format == "jpg" || format == "jpeg") {
    jpeg(filename, width = width, height = height)
  } else if (format == "pdf") {
    pdf(filename, width = width/72, height = height/72)  # PDF leva dimensões em polegadas
  } else if (format == "tiff" || format == "tif") {
    tiff(filename, width = width, height = height)
  } else {
    stop("Formato não suportado. Use 'png', 'jpg', 'jpeg', 'pdf' ou 'tiff'.")
  }
  
  # Criar o histograma
  hist(data, 
       breaks = bins, 
       main = "Histograma Gerado", 
       xlab = "Valores", 
       ylab = "Frequência", 
       col = "lightblue", 
       border = "black")
  
  # Fechar o dispositivo gráfico
  dev.off()
  
  # Retornar o nome do arquivo salvo
  cat("Histograma salvo como:", filename, "\n")
  return(filename)
}

# Exemplo de uso:
# generate_and_save_histogram()  # Usando dados aleatórios normais
# generate_and_save_histogram(runif(200, min=0, max=100), bins=20, format="pdf")  # Com dados personalizados