# Recurso Chef para gestionar archivos
file '/etc/myconfig.conf' do
  owner 'root'
  group 'root'
  mode '0644'
  content <<-EOH
# Configuración generada por Chef
[general]
enabled=true
timeout=30
EOH
  action :create
end