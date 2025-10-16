# Chef recipe to create a user

user 'demo_user' do
  comment 'Demo User'
  uid 1234
  gid 'users'
  home '/home/demo_user'
  shell '/bin/bash'
  password '$1$hashed_password$example'  # This should be a properly hashed password
  action :create
end

# Create the user's home directory
directory '/home/demo_user' do
  owner 'demo_user'
  group 'users'
  mode '0755'
  action :create
  recursive true
end