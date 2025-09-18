# Apache Installation Manifest
# This manifest installs and configures Apache web server

class apache {
  # Install Apache package
  package { 'apache2':
    ensure => installed,
  }

  # Enable and start Apache service
  service { 'apache2':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Package['apache2'],
  }
}

# Apply the apache class
include apache