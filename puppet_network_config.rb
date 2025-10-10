# Класс Puppet для настройки сети
class network_config {
  # Параметры для настройки интерфейса
  $interface_name = 'eth0' # Имя интерфейса
  $ip_address = '192.168.1.100' # IP-адрес
  $netmask = '255.255.255.0' # Маска подсети
  $gateway = '192.168.1.1' # Шлюз по умолчанию

  # Ресурс для управления сетевым интерфейсом
  # В этом примере предполагается, что используется модуль puppetlabs-network
  # или другой модуль, предоставляющий тип ресурса network::interface
  # network::interface { $interface_name:
  #   ensure => present,
  #   ipaddress => $ip_address,
  #   netmask => $netmask,
  #   gateway => $gateway,
  # }

  # Альтернативно, можно управлять файлами конфигурации напрямую
  # Пример для Debian/Ubuntu (файл /etc/network/interfaces)
  file { "/etc/network/interfaces.d/${interface_name}":
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "auto ${interface_name}\niface ${interface_name} inet static\naddress ${ip_address}\ngateway ${gateway}\nnetmask ${netmask}\n",
    require => Package['puppet-agent'], # Зависимость от пакета puppet-agent
    notify  => Exec['restart_network'], # Перезапустить сеть после изменений
  }

  # Команда для перезапуска сетевого сервиса
  exec { 'restart_network':
    command     => '/etc/init.d/networking restart', # Команда для Debian/Ubuntu
    refreshonly => true, # Выполнять только при уведомлении
  }

  # Управление файлом /etc/resolv.conf для DNS
  file { '/etc/resolv.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "nameserver 8.8.8.8\nnameserver 8.8.4.4\n",
  }
}