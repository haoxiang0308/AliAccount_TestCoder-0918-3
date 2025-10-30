#!/usr/bin/env groovy

// Ejemplo de cadenas interpoladas en Groovy
def nombre = "Juan"
def apellido = "Pérez"
def edad = 30
def ciudad = "Madrid"

// Interpolación de cadenas con ${}
println "Hola, me llamo ${nombre} ${apellido} y tengo ${edad} años."
println "Vivo en ${ciudad}."

// Puedes hacer operaciones dentro de la interpolación
def a = 5
def b = 3
println "La suma de ${a} y ${b} es ${a + b}."

// Interpolación sin llaves (solo funciona con variables simples)
println "Mi nombre es $nombre y tengo $edad años."

// Ejemplo con una lista
def frutas = ["manzana", "pera", "naranja"]
println "Tengo ${frutas.size()} frutas: ${frutas.join(', ')}."

// Interpolación en cadenas multilínea
def mensaje = """
    Nombre: ${nombre}
    Apellido: ${apellido}
    Edad: ${edad}
    Ciudad: ${ciudad}
"""
println mensaje