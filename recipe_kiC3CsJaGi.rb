# Recipe for installing nginx package
#
# This recipe installs the nginx package using the package resource.
# It ensures that nginx is installed and then starts and enables the service.

# Install the nginx package
package 'nginx' do
  action :install
end

# Start and enable the nginx service
service 'nginx' do
  action [:start, :enable]
end