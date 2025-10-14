# Класс Puppet для настройки сети
class network_config {
  # Параметры для настройки интерфейса
  $interface_name = 'eth1'
  $ip_address = '192.168.1.100'
  $netmask = '255.255.255.0'
  $gateway = '192.168.1.1'

  # Ресурс для управления сетевым интерфейсом (упрощённый пример)
  # В реальной среде Puppet могут использоваться модули типа 'puppetlabs-network'
  file { "/etc/network/interfaces.d/${interface_name}":
    ensure  => file,
    content => "
auto ${interface_name}
iface ${interface_name} inet static
    address ${ip_address}
    netmask ${netmask}
    gateway ${gateway}
    dns-nameservers 8.8.8.8 8.8.4.4
",
    require => Package['linux-base'],
    notify  => Exec['restart_network'],
  }

  # Команда для перезапуска сетевого сервиса после изменений
  exec { 'restart_network':
    command     => '/sbin/ifdown ${interface_name} && /sbin/ifup ${interface_name}',
    refreshonly => true,
  }
}