# Chef recipe to create a user

# Create a user with specified attributes
user 'demo_user' do
  comment 'Demo User for Testing'
  uid 1234
  gid 'users'
  home '/home/demo_user'
  shell '/bin/bash'
  password '$1$somehashedpassword'  # This should be a properly hashed password in real usage
  action [:create, :manage]
end

# Create the user's home directory
directory '/home/demo_user' do
  owner 'demo_user'
  group 'users'
  mode '0755'
  action :create
  recursive true
end