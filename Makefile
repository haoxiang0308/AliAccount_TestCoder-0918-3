# Definición de la variable para el nombre del ejecutable
EXECUTABLE_NAME := my_program

# Regla para guardar la variable en un archivo con nombre aleatorio
random_file:
	@echo "$(EXECUTABLE_NAME)" > $$(mktemp --suffix=.txt)
	@echo "Nombre del ejecutable guardado en archivo temporal"