# Puppet manifest to install Apache
class apache_install {
  package { 'httpd':
    ensure => installed,
  }

  service { 'httpd':
    ensure  => running,
    enable  => true,
    require => Package['httpd'],
  }
}

include apache_install