class apache {
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
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0644',
    require => Service['apache2'],
  }
}

include apache