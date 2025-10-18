class apache_install {
  package { 'apache2':
    ensure => installed,
  }

  service { 'apache2':
    ensure => running,
    enable => true,
    require => Package['apache2'],
  }

  file { '/var/www/html/index.html':
    content => "<html><body><h1>Hello from Puppet-managed Apache!</h1></body></html>",
    require => Service['apache2'],
  }
}

include apache_install