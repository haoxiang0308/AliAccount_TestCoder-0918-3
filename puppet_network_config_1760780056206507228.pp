# Puppet class for network configuration
class network_config {
  # Define network interfaces
  define network_interface (
    String $ipaddress,
    String $netmask,
    String $gateway = undef,
    Boolean $onboot = true,
    String $type = 'ethernet'
  ) {
    # Create network interface configuration file
    file { "/etc/sysconfig/network-scripts/ifcfg-${name}":
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('network_config/ifcfg.erb'),
      require => Package['initscripts'],
      notify  => Exec['network-service-restart'],
    }
  }

  # Manage network service
  service { 'network':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }

  # Execute to restart network service when needed
  exec { 'network-service-restart':
    command     => '/sbin/service network restart',
    refreshonly => true,
  }

  # Install required packages
  package { 'initscripts':
    ensure => installed,
  }

  # Manage DNS settings
  file { '/etc/resolv.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('network_config/resolv.conf.erb'),
  }

  # Manage main network configuration
  file { '/etc/sysconfig/network':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('network_config/network.erb'),
  }
}

# Example usage of the class
# class { 'network_config': }
# 
# network_config::network_interface { 'eth0':
#   ipaddress => '192.168.1.100',
#   netmask   => '255.255.255.0',
#   gateway   => '192.168.1.1',
#   onboot    => true,
# }