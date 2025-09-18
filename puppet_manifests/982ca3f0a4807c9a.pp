# Puppet manifest to install and configure Apache

# Define a class for Apache installation
class apache {
  # Install the Apache package
  package { 'apache2':
    ensure => installed,
  }

  # Enable and start the Apache service
  service { 'apache2':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Package['apache2'],
  }

  # Basic firewall configuration (if firewalld is used)
  exec { 'open_http_port':
    command     => 'firewall-cmd --permanent --add-service=http && firewall-cmd --reload',
    onlyif      => 'which firewall-cmd && firewall-cmd --list-services | grep -v http',
    refreshonly => true,
    subscribe   => Service['apache2'],
  }
}

# Include the apache class to apply the configuration
include apache