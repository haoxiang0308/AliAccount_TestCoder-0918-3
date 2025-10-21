# Puppet class for network configuration
class network_config {
  # Define network interface configuration parameters
  $network_interfaces = {
    'eth0' => {
      'ipaddress' => '192.168.1.10',
      'netmask'   => '255.255.255.0',
      'gateway'   => '192.168.1.1',
    },
    'eth1' => {
      'ipaddress' => '10.0.0.10',
      'netmask'   => '255.255.255.0',
    }
  }

  # Configure each network interface
  create_resources('network_interface', $network_interfaces)

  # Configure DNS settings
  file { '/etc/resolv.conf':
    ensure  => file,
    content => "nameserver 8.8.8.8\nnameserver 8.8.4.4\n",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  # Configure hostname
  file { '/etc/hostname':
    ensure  => file,
    content => "${::hostname}\n",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  # Manage network service
  service { 'network':
    ensure  => running,
    enable  => true,
    require => [File['/etc/resolv.conf'], File['/etc/hostname']],
  }
}

# Define network interface resource type
define network_interface (
  $ipaddress = undef,
  $netmask   = '255.255.255.0',
  $gateway   = undef,
) {
  # Create interface configuration file
  file { "/etc/network/interfaces.d/${name}":
    ensure  => file,
    content => template('network_interface.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  # Restart network service when interface changes
  Service['network'] -> File["/etc/network/interfaces.d/${name}"]
}