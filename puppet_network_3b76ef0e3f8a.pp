# Puppet class for network configuration
class network_config (
  # Parameters for network configuration
  String $interface = 'eth0',
  String $ip_address = '192.168.1.10',
  String $netmask = '255.255.255.0',
  String $gateway = '192.168.1.1',
  Array[String] $dns_servers = ['8.8.8.8', '8.8.4.4'],
  String $domain = 'example.com',
) {
  # Configure the network interface
  file { "/etc/network/interfaces.d/${interface}":
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('network_config/interface.erb'),
    require => Package['network-manager'],
    notify  => Service['networking'],
  }

  # Install network manager package
  package { 'network-manager':
    ensure => installed,
  }

  # Create network configuration directory if it doesn't exist
  file { '/etc/network/interfaces.d':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  # Set up DNS configuration
  file { '/etc/resolv.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => epp('network_config/resolv.conf.epp'),
    require => Package['net-tools'],
  }

  # Install required network tools
  package { 'net-tools':
    ensure => installed,
  }

  # Configure hostname
  file { '/etc/hostname':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "${facts['hostname']}\n",
  }

  # Configure hosts file
  host { $facts['hostname']:
    ip => $ip_address,
  }

  # Ensure networking service is running
  service { 'networking':
    ensure  => running,
    enable  => true,
    require => [
      File['/etc/network/interfaces.d/${interface}'],
      File['/etc/resolv.conf'],
    ],
  }

  # Configure static route if gateway is specified
  if $gateway != '' {
    file { "/etc/network/interfaces.d/${interface}-gateway":
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => "up route add default gw ${gateway}\n",
      require => File['/etc/network/interfaces.d/${interface}'],
      notify  => Service['networking'],
    }
  }
}

# Define a network interface resource type
define network_interface(
  String $ip,
  String $netmask = '255.255.255.0',
  Boolean $dhcp = false,
) {
  if $dhcp {
    $config_content = "iface ${name} inet dhcp\n"
  } else {
    $config_content = "iface ${name} inet static\naddress ${ip}\nnetmask ${netmask}\n"
  }

  file { "/etc/network/interfaces.d/${name}":
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "auto ${name}\n${config_content}",
  }
}