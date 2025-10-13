# Recipe to create a user

user 'new_user' do
  comment 'A new user account'
  home '/home/new_user'
  shell '/bin/bash'
  password '$1$hashedpassword$example' # This should be a real hash
  action :create
end