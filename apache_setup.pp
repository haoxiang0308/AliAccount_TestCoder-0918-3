# Puppet manifest to install Apache
class apache_setup {
  package { 'apache2':
    ensure => installed,
  }

  service { 'apache2':
    ensure  => running,
    enable  => true,
    require => Package['apache2'],
  }

  # Basic configuration file
  file { '/etc/apache2/sites-available/000-default.conf':
    ensure  => file,
    content => '<VirtualHost *:80>
    DocumentRoot /var/www/html
    <Directory /var/www/html>
        Options Indexes FollowSymLinks
        AllowOverride None
        Require all granted
    </Directory>
</VirtualHost>',
    require => Package['apache2'],
  }

  # Enable the default site
  exec { 'enable_default_site':
    command     => '/usr/sbin/a2ensite 000-default.conf',
    unless      => '/bin/test -L /etc/apache2/sites-enabled/000-default.conf',
    require     => File['/etc/apache2/sites-available/000-default.conf'],
    subscribe   => Package['apache2'],
    notify      => Service['apache2'],
  }
}

# Apply the class
include apache_setup