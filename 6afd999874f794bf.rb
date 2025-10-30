# Chef recipe to create a user

user 'example_user' do
  comment 'Example User'
  uid 1001
  gid 'users'
  home '/home/example_user'
  shell '/bin/bash'
  password '$1$hashedpassword$example'  # This should be a proper hash in real use
  action [:create, :manage]
end

# Ensure the user's home directory exists
directory '/home/example_user' do
  owner 'example_user'
  group 'users'
  mode '0755'
  action :create
  recursive true
end