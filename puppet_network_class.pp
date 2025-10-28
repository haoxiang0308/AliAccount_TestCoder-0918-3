# Puppet class for network configuration
class puppet_network_config {
  # Parameters for network configuration
  $interface = $facts['networking']['primary'],
  $ip_address = $facts['networking']['ip'],
  $netmask = $facts['networking']['netmask'],
  $gateway = $facts['networking']['default_gateway'],
  $dns_servers = $facts['networking']['dns']['nameservers']

  # Network interface configuration
  file { "/etc/network/interfaces.d/${interface}":
    ensure  => file,
    content => template('puppet_network_config/interface.erb'),
    require => Package['net-tools'],
    notify  => Exec['restart-networking'],
  }

  # Network configuration parameters
  file { '/etc/sysconfig/network':
    ensure  => file,
    content => template('puppet_network_config/network.erb'),
  }

  # DNS configuration
  file { '/etc/resolv.conf':
    ensure  => file,
    content => template('puppet_network_config/resolv.conf.erb'),
    require => Package['bind-utils'],
  }

  # Install required packages
  package { ['net-tools', 'bind-utils', 'network-manager']:
    ensure => installed,
  }

  # Restart networking service after changes
  exec { 'restart-networking':
    command     => '/bin/systemctl restart networking',
    refreshonly => true,
  }

  # Firewall configuration
  firewall { '100 allow http':
    dport => '80',
    proto => 'tcp',
    action => 'accept',
  }

  firewall { '101 allow https':
    dport => '443',
    proto => 'tcp',
    action => 'accept',
  }
}

# Alternative implementation for network configuration using network module
class puppet_network_config_alt {
  # Using the puppetlabs-network module approach
  network::interface { 'eth0':
    ipaddress => '192.168.1.10',
    netmask   => '255.255.255.0',
    gateway   => '192.168.1.1',
  }

  # DNS configuration
  network::dns { 'dns_config':
    servers => ['8.8.8.8', '8.8.4.4'],
    domain  => 'example.com',
  }
}