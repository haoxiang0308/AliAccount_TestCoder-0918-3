# Chef recipe to create a user

# Define a user resource
user 'example_user' do
  comment 'Example User'
  uid 1001
  gid 'users'
  home '/home/example_user'
  shell '/bin/bash'
  password '$1$somehashedpassword'  # This should be a properly hashed password
  action [:create, :manage]
end

# Create the user's home directory
directory '/home/example_user' do
  owner 'example_user'
  group 'users'
  mode '0755'
  action :create
  recursive true
end