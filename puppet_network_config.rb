# Класс Puppet для настройки сети
class NetworkConfig {
  # Параметры для настройки интерфейса
  $interface_name = $name
  $ip_address = $config['ip']
  $netmask = $config['netmask']
  $gateway = $config['gateway']

  # Ресурс для управления файлом конфигурации интерфейса
  file { "/etc/network/interfaces.d/${interface_name}":
    ensure  => file,
    content => template('network/interface.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['puppet-agent'],
    notify  => Exec['restart_networking'],
  }

  # Перезапуск службы сети после изменений
  exec { 'restart_networking':
    command     => '/sbin/ifdown --force eth0 && /sbin/ifup eth0',
    refreshonly => true,
  }
}

# Пример использования
# network_config { 'eth0':
#   config => {
#     ip      => '192.168.1.10',
#     netmask => '255.255.255.0',
#     gateway => '192.168.1.1',
#   }
# }