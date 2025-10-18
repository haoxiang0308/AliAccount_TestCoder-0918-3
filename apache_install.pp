# Apache installation manifest
class apache_install {
  # Install Apache package
  package { 'apache2':
    ensure => installed,
  }

  # Ensure Apache service is running and enabled
  service { 'apache2':
    ensure  => running,
    enable  => true,
    require => Package['apache2'],
  }

  # Create a basic index page
  file { '/var/www/html/index.html':
    ensure  => file,
    content => '<html><body><h1>Apache is running!</h1></body></html>',
    require => Service['apache2'],
  }
}

# Apply the class
include apache_install