# Chef Recipe to Install a Package
#
# This recipe installs a package using the package resource

# Install the vim package
package 'vim' do
  action :install
end

# Example of installing multiple packages
%w[git curl wget].each do |pkg|
  package pkg do
    action :install
  end
end

# Print a message after installation
log 'Package installation completed' do
  level :info
end