# Класс Puppet для настройки сети
class network_config {
  # Параметры класса
  $interface = $network_config::interface,
  $ip_address = $network_config::ip_address,
  $netmask = $network_config::netmask,
  $gateway = $network_config::gateway,
) {

  # Ресурс для управления конфигурацией интерфейса (пример для Debian/Ubuntu)
  file { "/etc/network/interfaces.d/${interface}":
    ensure  => file,
    content => "
# The primary network interface
auto ${interface}
iface ${interface} inet static
    address ${ip_address}
    netmask ${netmask}
    gateway ${gateway}
",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['linux-base'], # Зависимость от пакета
    notify  => Exec['restart_network'], # Перезапуск сети после изменения
  }

  # Ресурс для перезапуска службы сети
  exec { 'restart_network':
    command     => '/sbin/ifdown ${interface} && /sbin/ifup ${interface}',
    refreshonly => true,
  }

  # Управление DNS (опционально, через resolv.conf)
  file { '/etc/resolv.conf':
    ensure  => file,
    content => "
nameserver 8.8.8.8
nameserver 8.8.4.4
",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}

# Пример использования класса
# class { 'network_config':
#   interface => 'eth0',
#   ip_address => '192.168.1.100',
#   netmask => '255.255.255.0',
#   gateway => '192.168.1.1',
# }