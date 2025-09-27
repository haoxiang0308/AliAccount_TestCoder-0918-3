#
# Cookbook:: my_cookbook
# Recipe:: default
#
# Copyright:: 2024, Your Name
#

user 'new_user' do
  comment 'A new user account'
  uid 1234
  gid 'users'
  home '/home/new_user'
  shell '/bin/bash'
  password '$1$hashed_password$example_hash' # Use a real hashed password
  action [:create, :manage]
end
