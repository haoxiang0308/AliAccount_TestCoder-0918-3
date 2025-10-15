# Puppet class for network configuration
class puppet_network_config {
  # Parameters for network configuration
  $interface = 'eth0',
  $ip_address = '192.168.1.10',
  $netmask = '255.255.255.0',
  $gateway = '192.168.1.1',
  $dns_servers = ['8.8.8.8', '8.8.4.4']
) {
  
  # Configure network interface
  file { "/etc/network/interfaces.d/${interface}":
    ensure  => file,
    content => template('puppet_network_config/interface.erb'),
    require => Package['network-manager'],
    notify  => Exec['restart-networking'],
  }

  # Install required network packages
  package { 'network-manager':
    ensure => installed,
  }

  # Restart networking service after changes
  exec { 'restart-networking':
    command     => '/sbin/service networking restart',
    refreshonly => true,
  }

  # Configure DNS settings
  file { '/etc/resolv.conf':
    ensure  => file,
    content => epp('puppet_network_config/resolv.conf.epp'),
    require => Package['net-tools'],
  }

  # Ensure net-tools package is installed
  package { 'net-tools':
    ensure => installed,
  }
}

# Alternative implementation for systemd-networkd systems
class puppet_network_config::systemd_networkd (
  $interface = 'eth0',
  $ip_address = '192.168.1.10',
  $netmask = '255.255.255.0',
  $gateway = '192.168.1.1'
) {
  # Install systemd-networkd if not already installed
  package { 'systemd':
    ensure => installed,
  }

  # Create network configuration file
  file { "/etc/systemd/network/${interface}.network":
    ensure  => file,
    content => epp('
      [Match]
      Name=${interface}

      [Network]
      Address=${ip_address}/${netmask}
      Gateway=${gateway}
      DNS=8.8.8.8
      DNS=8.8.4.4
    '),
    require => Package['systemd'],
    notify  => Service['systemd-networkd'],
  }

  # Ensure systemd-networkd service is running
  service { 'systemd-networkd':
    ensure  => running,
    enable  => true,
    require => File["/etc/systemd/network/${interface}.network"],
  }
}