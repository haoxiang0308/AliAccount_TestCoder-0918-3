#
# Cookbook:: my_cookbook
# Recipe:: create_user
#
# Copyright:: 2025, Your Name
#

# This recipe creates a system user named 'newuser'.

user 'newuser' do
  comment 'A new system user'
  home '/home/newuser'
  shell '/bin/bash'
  password '$1$hashedpassword$example' # This should be a real hashed password
  manage_home true
  action [:create, :manage]
end