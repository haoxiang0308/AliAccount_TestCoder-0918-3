# This file was generated to define a Puppet class for network configuration.

class network_config {
  # Example parameters for network interface configuration
  $interface = 'eth0',
  $ip_address = '192.168.1.10',
  $netmask = '255.255.255.0',
  $gateway = '192.168.1.1',
  $dns_servers = ['8.8.8.8', '8.8.4.4']
) {

  # Resource to manage the network interface configuration file
  # This is a simplified example, actual implementation might vary based on OS
  file { "/etc/network/interfaces.d/${interface}":
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "
auto ${interface}
iface ${interface} inet static
    address ${ip_address}
    netmask ${netmask}
    gateway ${gateway}
    dns-nameservers ${join($dns_servers, ' ')}
",
  }

  # Service to restart networking (example, may need adjustment)
  # service { 'networking':
  #   enable => true,
  #   ensure => running,
  #   subscribe => File["/etc/network/interfaces.d/${interface}"], # Restart if config file changes
  # }
}