# Класс Puppet для настройки сети
class NetworkConfig {
  # Параметры для настройки интерфейса
  $interface = 'eth0',
  $ip_address = '192.168.1.10',
  $netmask = '255.255.255.0',
  $gateway = '192.168.1.1',
) {
  # Ресурс для управления файлом конфигурации интерфейса
  file { "/etc/network/interfaces.d/${interface}":
    ensure  => file,
    content => template('network_config/network_interface.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['ifupdown'],
    notify  => Exec['apply_network_config'],
  }

  # Выполнение команды для применения конфигурации сети
  exec { 'apply_network_config':
    command     => "/sbin/ifup ${interface}",
    refreshonly => true,
  }
}