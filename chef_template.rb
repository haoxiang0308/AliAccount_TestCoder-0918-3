# Exemplo de template em Chef para gerar arquivos de configuração
# Este é um arquivo de receita Chef (recipe) que usa um template para gerar um arquivo de configuração

template '/tmp/myconfig.conf' do
  source 'myconfig.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    database_host: 'localhost',
    database_port: 5432,
    app_name: 'MyApplication',
    debug_mode: true
  )
  action :create
end