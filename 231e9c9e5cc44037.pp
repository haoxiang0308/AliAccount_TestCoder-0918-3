# Puppet class for network configuration
class puppet_network_config {
  # Define network interface configuration parameters
  $network_interfaces = hiera('network_interfaces', {})

  # Configure each network interface
  create_resources('network_interface', $network_interfaces)

  # Manage network service
  service { 'network':
    ensure  => running,
    enable  => true,
    require => Package['network-scripts'],  # Assuming RHEL/CentOS
  }

  # Install network configuration package if needed
  package { 'network-scripts':
    ensure => installed,
  }

  # Configure DNS settings
  $dns_servers = hiera('dns_servers', ['8.8.8.8', '8.8.4.4'])
  $search_domains = hiera('search_domains', ['localdomain'])

  file { '/etc/resolv.conf':
    ensure  => file,
    content => epp("nameserver ${join($dns_servers, "\nnameserver ")}\nsearch ${join($search_domains, ' ')}\n"),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  # Configure hostname
  $hostname = hiera('hostname', 'localhost')
  file { '/etc/hostname':
    ensure  => file,
    content => "${hostname}\n",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  # Manage firewall settings
  $firewall_rules = hiera('firewall_rules', [])
  create_resources('firewall', $firewall_rules)
}

# Define a network interface resource type
define network_interface (
  $ipaddress = undef,
  $netmask   = undef,
  $gateway   = undef,
  $onboot    = 'yes',
  $bootproto = 'static',
) {
  # Create network configuration file for the interface
  if $ipaddress and $netmask {
    $interface_name = $name
    $config_file = "/etc/sysconfig/network-scripts/ifcfg-${interface_name}"

    file { $config_file:
      ensure  => file,
      content => epp("
DEVICE=${interface_name}
BOOTPROTO=${bootproto}
IPADDR=${ipaddress}
NETMASK=${netmask}
ONBOOT=${onboot}
${if $gateway { "${empty}GATEWAY=${gateway}" } else { "" }}
"),
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
    }
  }
}