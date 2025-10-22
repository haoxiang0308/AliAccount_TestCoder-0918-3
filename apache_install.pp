# Puppet manifest to install Apache
class apache_install {
  package { 'apache2':
    ensure => installed,
  }

  service { 'apache2':
    ensure  => running,
    enable  => true,
    require => Package['apache2'],
  }

  # Ensure the default site is enabled
  exec { 'enable_default_site':
    command     => '/usr/sbin/a2ensite 000-default',
    creates     => '/etc/apache2/sites-enabled/000-default.conf',
    notify      => Service['apache2'],
    require     => Package['apache2'],
    onlyif      => '/bin/test -f /etc/apache2/sites-available/000-default.conf',
  }
}

# Apply the class
include apache_install