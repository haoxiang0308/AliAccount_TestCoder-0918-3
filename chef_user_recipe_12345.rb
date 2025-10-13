# Recipe to create a user

user 'new_user' do
  comment 'A new user account'
  uid 12345
  gid 'users'
  home '/home/new_user'
  shell '/bin/bash'
  password '$1$hashed_password_example' # This should be a properly hashed password
  action [:create, :manage]
end