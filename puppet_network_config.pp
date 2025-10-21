# Puppet class for network configuration
class puppet_network_config {
  # Parameters for network configuration
  param {
    $interface => 'eth0',
    $ipaddress => '192.168.1.10',
    $netmask   => '255.255.255.0',
    $gateway   => '192.168.1.1',
    $dns_servers => ['8.8.8.8', '8.8.4.4'],
  }

  # Configure network interface
  file { "/etc/network/interfaces.d/${interface}":
    ensure  => file,
    content => template('puppet_network_config/interface.erb'),
    require => Package['network-manager'],
    notify  => Exec['restart-networking'],
  }

  # Install required network packages
  package { 'network-manager':
    ensure => installed,
  }

  # Apply network configuration
  exec { 'restart-networking':
    command     => '/sbin/ifdown ${interface} && /sbin/ifup ${interface}',
    refreshonly => true,
  }

  # Set DNS configuration
  file { '/etc/resolv.conf':
    ensure  => file,
    content => generate_dns_content($dns_servers),
    mode    => '0644',
  }

  # Function to generate DNS content
  define generate_dns_content(Array[String] $servers) {
    $content = $servers.map |$server| { "nameserver ${server}" }.join("\n")
    file { '/etc/resolv.conf':
      ensure  => file,
      content => $content,
      mode    => '0644',
    }
  }
}

# Alternative implementation with more specific network settings
class puppet_network_config (
  String $interface = 'eth0',
  String $ipaddress = '192.168.1.10',
  String $netmask = '255.255.255.0',
  String $gateway = '192.168.1.1',
  Array[String] $dns_servers = ['8.8.8.8', '8.8.4.4'],
  Optional[String] $hostname = undef,
) {
  # Set hostname if provided
  if $hostname {
    file { '/etc/hostname':
      ensure  => file,
      content => "${hostname}\n",
      mode    => '0644',
    }
    
    exec { 'set-hostname':
      command => "/bin/hostnamectl set-hostname ${hostname}",
      onlyif  => "/bin/hostname | /bin/grep -v ${hostname}",
    }
  }

  # Configure static IP for the interface
  file { "/etc/network/interfaces.d/${interface}":
    ensure => file,
    content => inline_template("
# Configured by Puppet
auto <%= @interface %>
iface <%= @interface %> inet static
    address <%= @ipaddress %>
    netmask <%= @netmask %>
    gateway <%= @gateway %>
    dns-nameservers <%= @dns_servers.join(' ') %>
"),
    require => Package['net-tools'],
    notify  => Exec['apply-network-config'],
  }

  # Install required packages
  package { ['net-tools', 'network-manager']:
    ensure => installed,
  }

  # Apply network configuration
  exec { 'apply-network-config':
    command     => "/sbin/ifdown ${interface} && /sbin/ifup ${interface}",
    refreshonly => true,
  }

  # Ensure networking service is running
  service { 'networking':
    ensure  => running,
    enable  => true,
    require => [Package['net-tools'], File["/etc/network/interfaces.d/${interface}"]],
  }
}