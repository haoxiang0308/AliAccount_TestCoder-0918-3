#
# Chef recipe to create a user
#

# Create a system user named 'myuser'
user 'myuser' do
  comment 'My System User'
  uid 1001
  gid 'users'
  home '/home/myuser'
  shell '/bin/bash'
  password '$1$xyz$wHSvF4f5GgWUIwKU5ZD5T1' # Example encrypted password
  action :create
end

# Create the user's home directory
directory '/home/myuser' do
  owner 'myuser'
  group 'users'
  mode '0755'
  action :create
end