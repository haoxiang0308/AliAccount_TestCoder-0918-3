# Модуль для настройки сети с помощью Puppet

class network_config {
  # Параметры класса (опционально)
  # $eth0_ip = '192.168.1.10',
  # $eth0_netmask = '255.255.255.0',
  # $default_gateway = '192.168.1.1',
  # $dns_servers = ['8.8.8.8', '8.8.4.4'],

  # Ресурс для управления интерфейсом eth0 (пример для Debian/Ubuntu)
  file { '/etc/network/interfaces.d/eth0':
    ensure  => file,
    content => "# Managed by Puppet\nauto eth0\niface eth0 inet static\n  address ${eth0_ip}\n  netmask ${eth0_netmask}\n  gateway ${default_gateway}\n",
    require => Package['linux-image-extra-virtual'], # Пример зависимости
  }

  # Ресурс для управления DNS (пример для /etc/resolv.conf)
  file { '/etc/resolv.conf':
    ensure  => file,
    content => "nameserver ${dns_servers[0]}\nnameserver ${dns_servers[1]}\n",
    require => File['/etc/network/interfaces.d/eth0'],
  }

  # Перезапуск службы сети для применения изменений
  service { 'networking':
    enable => true,
    ensure => running,
    require => [File['/etc/network/interfaces.d/eth0'], File['/etc/resolv.conf']],
    subscribe => [File['/etc/network/interfaces.d/eth0'], File['/etc/resolv.conf']], # Перезапуск при изменении файлов
  }
}
