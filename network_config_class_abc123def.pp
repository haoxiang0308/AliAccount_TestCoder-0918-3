# Puppet class for network configuration
class network_config (
  String $interface = $facts['networking']['primary'],
  String $ip_address = '192.168.1.10',
  String $netmask = '255.255.255.0',
  String $gateway = '192.168.1.1',
  Array[String] $dns_servers = ['8.8.8.8', '8.8.4.4'],
  String $domain = 'example.local'
) {
  
  # Install network utilities
  package { ['net-tools', 'iproute2', 'bind-utils']:
    ensure => installed,
  }

  # Configure network interface
  file { "/etc/network/interfaces.d/${interface}":
    ensure  => file,
    content => template('network_config/interface.erb'),
    require => Package['net-tools'],
    notify  => Service['networking'],
  }

  # Set hostname
  file { '/etc/hostname':
    ensure  => file,
    content => "${facts['hostname']}\n",
    require => Package['net-tools'],
  }

  # Configure DNS
  file { '/etc/resolv.conf':
    ensure  => file,
    content => epp('network_config/resolv.conf.epp'),
    require => Package['bind-utils'],
  }

  # Configure hosts file
  host { 'localhost':
    ip => '127.0.0.1',
  }

  # Manage networking service
  service { 'networking':
    ensure  => running,
    enable  => true,
    require => [
      Package['net-tools'],
      File["/etc/network/interfaces.d/${interface}"],
    ],
  }

  # Optional: Configure firewall rules
  firewall { '100 allow SSH':
    dport  => 22,
    proto  => 'tcp',
    action => 'accept',
  }

  firewall { '101 allow HTTP':
    dport  => 80,
    proto  => 'tcp',
    action => 'accept',
  }

  firewall { '102 allow HTTPS':
    dport  => 443,
    proto  => 'tcp',
    action => 'accept',
  }

  # Route configuration (if needed)
  file { '/etc/network/routes':
    ensure  => file,
    content => template('network_config/routes.epp'),
    require => Package['net-tools'],
  }
}

# Define to configure additional network interfaces
define network_config::interface (
  String $ipaddress,
  String $netmask = '255.255.255.0',
  Boolean $use_dhcp = false,
) {
  file { "/etc/network/interfaces.d/${name}":
    ensure  => file,
    content => epp('network_config/additional_interface.epp'),
    require => Package['net-tools'],
    notify  => Service['networking'],
  }
}