#!/usr/bin/env groovy

// Variables para interpolación
def nombre = 'Groovy'
def version = '5.0.2'
def x = 10
def y = 20
def lista = [1, 2, 3, 4, 5]

// Ejemplos de interpolación de cadenas en Groovy
println "Bienvenido a ${nombre} versión ${version}!"
println "Ejemplos de interpolación de cadenas:"
println "La suma de ${x} y ${y} es ${x + y}"
println "La multiplicación de ${x} y ${y} es ${x * y}"
println "Lista: ${lista}"
println "Primer elemento de la lista: ${lista[0]}"
println "Tamaño de la lista: ${lista.size()}"
println "Texto con interpolación: ${'Este texto está' + ' interpolado'}"
println "Interpolación con expresión: ${3 > 2 ? 'Verdadero' : 'Falso'}"

// Ejemplo de interpolación en una cadena multilínea
def mensaje = """Este es un ejemplo de cadena multilínea
con interpolación de variables:
Nombre: ${nombre}
Versión: ${version}
Fecha actual: ${new Date()}
"""

println mensaje