# Función para calcular la desviación estándar
calcular_desviacion_estandar <- function(datos) {
  if (is.numeric(datos) && length(datos) > 1) {
    varianza <- var(datos)
    desviacion_estandar <- sqrt(varianza)
    return(desviacion_estandar)
  } else {
    stop("El vector debe ser numérico y contener más de un elemento")
  }
}

# Ejemplo de uso:
# datos_ejemplo <- c(1, 2, 3, 4, 5)
# resultado <- calcular_desviacion_estandar(datos_ejemplo)
# print(resultado)