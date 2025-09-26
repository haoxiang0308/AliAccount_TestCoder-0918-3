# Класс Puppet для настройки сети
class NetworkConfig {
  # Параметры для настройки интерфейса
  $interface_name = 'eth0',
  $ip_address = '192.168.1.10',
  $netmask = '255.255.255.0',
  $gateway = '192.168.1.1',
) {
  # Ресурс для управления сетевым интерфейсом (упрощённый пример)
  # В реальном сценарии использовались бы puppet-провайдеры для конкретной ОС
  file { "/etc/network/interfaces.d/${interface_name}":
    ensure  => file,
    content => "
auto ${interface_name}
iface ${interface_name} inet static
    address ${ip_address}
    netmask ${netmask}
    gateway ${gateway}
",
    require => Package['network-manager'],
  }

  # Убедиться, что служба сети перезапущена после изменений
  exec { "restart_network_${interface_name}":
    command     => '/sbin/ifdown ${interface_name} && /sbin/ifup ${interface_name}',
    refreshonly => true,
    subscribe   => File["/etc/network/interfaces.d/${interface_name}"],
  }
}