# This Puppet manifest installs and configures Apache
class apache_setup {
  package { 'apache2':
    ensure => installed,
  }

  service { 'apache2':
    ensure  => running,
    enable  => true,
    require => Package['apache2'],
  }

  file { '/var/www/html/index.html':
    ensure  => file,
    content => "<html><body><h1>Hello from Puppet-managed Apache!</h1></body></html>",
    require => Service['apache2'],
  }
}

include apache_setup