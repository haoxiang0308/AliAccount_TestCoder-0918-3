# Recurso Chef para gestionar archivos
# Este recurso permite crear, actualizar o eliminar archivos en el sistema

file '/tmp/ejemplo.txt' do
  content 'Este es un archivo de ejemplo gestionado por Chef'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

# Ejemplo de recurso para eliminar un archivo
file '/tmp/archivo_a_eliminar.txt' do
  action :delete
end

# Ejemplo de recurso para gestionar permisos de un archivo existente
file '/tmp/archivo_existente.txt' do
  owner 'root'
  group 'users'
  mode '0644'
  action :create
  not_if { File.exist?('/tmp/archivo_existente.txt') }
end