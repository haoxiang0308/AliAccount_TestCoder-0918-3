# Chef Recipe to configure firewall rules
# This recipe sets up basic firewall rules using the iptables or ufw resources

# Configure firewall using iptables
# Allow SSH connections (port 22)
iptables_rule 'allow_ssh' do
  rule '-p tcp --dport 22 -j ACCEPT'
  action :create
end

# Allow HTTP connections (port 80)
iptables_rule 'allow_http' do
  rule '-p tcp --dport 80 -j ACCEPT'
  action :create
end

# Allow HTTPS connections (port 443)
iptables_rule 'allow_https' do
  rule '-p tcp --dport 443 -j ACCEPT'
  action :create
end

# Allow loopback connections
iptables_rule 'allow_loopback' do
  rule '-i lo -j ACCEPT'
  action :create
end

# Allow established connections
iptables_rule 'allow_established' do
  rule '-m state --state ESTABLISHED,RELATED -j ACCEPT'
  action :create
end

# Default policy: drop everything else
iptables_rule 'default_drop' do
  rule '-j DROP'
  action :create
  chain 'INPUT'
end

# Alternative: Using UFW (Uncomplicated Firewall) on Ubuntu systems
# Uncomment the following lines if you prefer to use UFW instead of iptables

# package 'ufw' do
#   action :install
# end

# ufw_rule 'allow SSH' do
#   port 22
#   direction 'in'
#   protocol 'tcp'
#   action 'allow'
#   only_if { platform?('ubuntu', 'debian') }
# end

# ufw_rule 'allow HTTP' do
#   port 80
#   direction 'in'
#   protocol 'tcp'
#   action 'allow'
#   only_if { platform?('ubuntu', 'debian') }
# end

# ufw_rule 'allow HTTPS' do
#   port 443
#   direction 'in'
#   protocol 'tcp'
#   action 'allow'
#   only_if { platform?('ubuntu', 'debian') }
# end

# ufw 'enable' do
#   action [:enable]
#   only_if { platform?('ubuntu', 'debian') }
# end