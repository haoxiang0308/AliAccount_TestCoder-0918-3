import strutils, random, os

# Inicializar generador de números aleatorios
randomize()

# Cadenas de ejemplo para el nombre completo
let firstName = "juan"
let lastName = "pérez"

# Formatear el nombre completo: capitalizar primera letra de cada parte
let formattedFirstName = capitalizeAscii(firstName)
let formattedLastName = capitalizeAscii(lastName)
let fullName = formattedFirstName & " " & formattedLastName

echo "Nombre formateado: " & fullName

# Generar un nombre de archivo aleatorio
let randomSuffix = rand(1000..9999)
let fileName = "nombre_" & $randomSuffix & ".txt"

# Escribir el nombre formateado en el archivo
try:
  var file = open(fileName, fmWrite)
  defer: close(file)
  file.write(fullName)
  echo "Archivo guardado como: " & fileName
except:
  echo "Error al escribir el archivo"
