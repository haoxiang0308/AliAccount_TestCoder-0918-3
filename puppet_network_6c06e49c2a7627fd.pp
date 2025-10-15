# Puppet class for network configuration
class puppet_network_config {
  # Parameters for network configuration
  $interface = $facts['networking']['primary'],
  $ip_address = '192.168.1.10',
  $netmask = '255.255.255.0',
  $gateway = '192.168.1.1',
  $dns_servers = ['8.8.8.8', '8.8.4.4']

  # Configure network interface
  file { "/etc/network/interfaces.d/${interface}":
    ensure  => file,
    content => template('puppet_network_config/interface.erb'),
    require => Package['network-manager'],
    notify  => Service['networking'],
  }

  # Set up DNS configuration
  file { '/etc/resolv.conf':
    ensure  => file,
    content => epp('puppet_network_config/resolv.conf.epp'),
    require => Package['resolvconf'],
  }

  # Install required packages
  package { ['network-manager', 'resolvconf']:
    ensure => installed,
  }

  # Manage networking service
  service { 'networking':
    ensure  => running,
    enable  => true,
    require => [
      Package['network-manager'],
      File["/etc/network/interfaces.d/${interface}"],
    ],
  }

  # Configure hostname
  file { '/etc/hostname':
    ensure  => file,
    content => "${facts['hostname']}\n",
    mode    => '0644',
  }

  # Add default route
  exec { 'add_default_route':
    command     => "/sbin/ip route add default via ${gateway}",
    onlyif      => "/sbin/ip route | grep -q 'default'",
    require     => Service['networking'],
    refreshonly => true,
  }
}

# Define resource for individual network interfaces
define puppet_network_config::interface(
  String $ipaddress,
  String $netmask = '255.255.255.0',
  Optional[String] $gateway = undef,
  Boolean $manage_route = false
) {
  # Create interface configuration file
  file { "/etc/network/interfaces.d/${name}":
    ensure  => file,
    content => template('puppet_network_config/define_interface.erb'),
    require => Package['network-manager'],
    notify  => Service['networking'],
  }

  # Optionally manage default gateway
  if $manage_route and $gateway {
    route { "default_${name}":
      ensure   => present,
      gateway  => $gateway,
      interface => $name,
      require  => File["/etc/network/interfaces.d/${name}"],
    }
  }
}