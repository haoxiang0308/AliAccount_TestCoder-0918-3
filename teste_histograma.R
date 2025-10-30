# Script de teste para a função gerar_histograma

# Carregar a função
source("gerar_histograma.R")

# Teste 1: Gerar histograma com dados aleatórios (padrão)
cat("Teste 1: Gerando histograma com dados aleatórios...\n")
arquivo1 <- gerar_histograma()
cat("Histograma salvo em:", arquivo1, "\n\n")

# Teste 2: Gerar histograma com dados específicos
cat("Teste 2: Gerando histograma com dados específicos...\n")
dados_teste <- c(rnorm(500, mean = 5, sd = 2), rnorm(500, mean = 10, sd = 3))
arquivo2 <- gerar_histograma(dados = dados_teste, titulo = "Histograma de Dados Específicos")
cat("Histograma salvo em:", arquivo2, "\n\n")

# Teste 3: Gerar histograma em formato PDF
cat("Teste 3: Gerando histograma em formato PDF...\n")
arquivo3 <- gerar_histograma(extensao = "pdf", titulo = "Histograma em PDF")
cat("Histograma PDF salvo em:", arquivo3, "\n\n")

# Teste 4: Gerar histograma com número específico de dados
cat("Teste 4: Gerando histograma com 500 dados...\n")
arquivo4 <- gerar_histograma(n = 500, titulo = "Histograma com 500 dados")
cat("Histograma salvo em:", arquivo4, "\n\n")

cat("Todos os testes concluídos!\n")