# Chef recipe to create a user

# Create a user with specified attributes
user 'myuser' do
  comment 'My Test User'
  uid 1234
  gid 'users'
  home '/home/myuser'
  shell '/bin/bash'
  password '$6$salt$encrypted_password_here'  # This is a placeholder encrypted password
  action [:create, :manage]
end

# Create the user's home directory
directory '/home/myuser' do
  owner 'myuser'
  group 'users'
  mode '0755'
  action :create
  recursive true
end

# Add user to additional groups if needed
group 'additional_group' do
  action :modify
  members 'myuser'
  append true
end