#
# Chef recipe to create a user
#

# Create a system user
user 'appuser' do
  comment 'Application User'
  uid 1002
  gid 'users'
  home '/home/appuser'
  shell '/bin/bash'
  action :create
end

# Create the user's home directory
directory '/home/appuser' do
  owner 'appuser'
  group 'users'
  mode '0755'
  action :create
end

# Create a directory for application logs
directory '/var/log/myapp' do
  owner 'appuser'
  group 'users'
  mode '0755'
  action :create
end