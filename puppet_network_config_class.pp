class PuppetNetworkConfig {
  # Network configuration parameters
  $interface = 'eth0'
  $ip_address = '192.168.1.10'
  $netmask = '255.255.255.0'
  $gateway = '192.168.1.1'
  $dns_servers = ['8.8.8.8', '8.8.4.4']

  # Configure network interface
  file { "/etc/network/interfaces.d/${interface}":
    ensure  => file,
    content => template('puppet_network_config/interface.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['linux-base'],
    notify  => Exec['restart-networking'],
  }

  # Restart networking service after changes
  exec { 'restart-networking':
    command     => '/sbin/ifdown ${interface} && /sbin/ifup ${interface}',
    refreshonly => true,
  }

  # Install required packages
  package { 'network-manager':
    ensure => installed,
  }

  # Set hostname if needed
  file { '/etc/hostname':
    ensure  => file,
    content => "${hostname}\n",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  # DNS configuration
  file { '/etc/resolv.conf':
    ensure  => file,
    content => epp('puppet_network_config/resolv.epp'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}

# Define to configure a specific network interface
define PuppetNetworkConfig::interface(
  String $ip,
  String $netmask = '255.255.255.0',
  Optional[String] $gateway = undef,
  Array[String] $dns_servers = ['8.8.8.8', '8.8.4.4']
) {
  # This would configure a specific interface with given parameters
  # Implementation would depend on the target OS
}