# Función para calcular la desviación estándar
calcular_desviacion_estandar <- function(datos) {
  # Verificar que los datos sean numéricos
  if (!is.numeric(datos)) {
    stop("Los datos deben ser numéricos")
  }
  
  # Calcular la desviación estándar
  desviacion_estandar <- sqrt(var(datos))
  
  return(desviacion_estandar)
}

# Alternativamente, una versión más simple que usa la función sd() de R
calcular_desviacion_estandar_simple <- function(datos) {
  # Verificar que los datos sean numéricos
  if (!is.numeric(datos)) {
    stop("Los datos deben ser numéricos")
  }
  
  # Calcular la desviación estándar usando la función sd()
  desviacion_estandar <- sd(datos)
  
  return(desviacion_estandar)
}

# Ejemplo de uso:
# datos_ejemplo <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
# resultado <- calcular_desviacion_estandar(datos_ejemplo)
# print(paste("La desviación estándar es:", resultado))