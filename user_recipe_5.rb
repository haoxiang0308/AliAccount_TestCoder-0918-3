# Recipe to create a user

user 'new_user' do
  comment 'A new user account'
  uid 1234
  gid 'users'
  home '/home/new_user'
  shell '/bin/bash'
  password '$1$hashed_password$example'
  action :create
end