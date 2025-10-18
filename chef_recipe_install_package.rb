# Chef Recipe to Install a Package
#
# This recipe demonstrates how to install a package using Chef

# Install the 'curl' package
package 'curl' do
  action :install
end

# Example of installing multiple packages
%w[wget git vim].each do |pkg|
  package pkg do
    action :install
  end
end

# Notify when installation is complete
log 'Package installation complete' do
  level :info
  notifies :run, 'execute[refresh-package-cache]', :immediately
end

execute 'refresh-package-cache' do
  command 'echo "Package cache refreshed"'
  action :nothing
end