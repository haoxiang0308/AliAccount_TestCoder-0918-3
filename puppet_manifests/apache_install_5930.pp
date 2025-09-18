# Apache Installation Manifest
# This manifest installs and configures Apache web server

class apache {
  package { 'apache2':
    ensure => installed,
  }

  service { 'apache2':
    ensure     => running,
    enable     => true,
    require    => Package['apache2'],
  }
}

# Apply the apache class
include apache