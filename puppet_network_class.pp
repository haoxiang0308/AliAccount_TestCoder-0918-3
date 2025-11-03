# Puppet class for network configuration
class puppet_network_config {
  # Define network interface parameters
  $interface_name = 'eth0'
  $ip_address = '192.168.1.100'
  $netmask = '255.255.255.0'
  $gateway = '192.168.1.1'
  $dns_servers = ['8.8.8.8', '8.8.4.4']

  # Configure network interface
  file { "/etc/network/interfaces.d/${interface_name}":
    ensure  => file,
    content => template('puppet_network_config/interface.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['network-manager'],
    notify  => Exec['restart-network'],
  }

  # Install required network package
  package { 'network-manager':
    ensure => installed,
  }

  # Set hostname
  file { '/etc/hostname':
    ensure  => file,
    content => "${facts['hostname']}\n",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  # Configure DNS
  file { '/etc/resolv.conf':
    ensure  => file,
    content => epp('puppet_network_config/resolv.conf.epp'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  # Restart network service after changes
  exec { 'restart-network':
    command     => '/etc/init.d/networking restart',
    refreshonly => true,
  }

  # Alternative network configuration for systemd-based systems
  systemd::service { 'network':
    enable => true,
    ensure => running,
  }
}

# Define a network interface resource type
define puppet_network_config::interface (
  String $ipaddr,
  String $netmask = '255.255.255.0',
  Optional[String] $gateway = undef,
  Optional[Array[String]] $dns_servers = [],
) {
  # Implementation of individual interface configuration
  file { "/etc/sysconfig/network-scripts/ifcfg-${name}":
    ensure  => file,
    content => epp('puppet_network_config/ifcfg.epp', {
      interface_name => $name,
      ip_address     => $ipaddr,
      netmask        => $netmask,
      gateway        => $gateway,
      dns_servers    => $dns_servers,
    }),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}