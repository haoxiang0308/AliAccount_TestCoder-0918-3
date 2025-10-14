# Puppet manifest to install Apache web server

class apache {
  # Manage the Apache package
  package { 'httpd':
    ensure => installed,
  }

  # Manage the Apache service
  service { 'httpd':
    ensure  => running,
    enable  => true,
    require => Package['httpd'], # Ensure the package is installed before starting the service
  }
}

# Apply the class
include apache