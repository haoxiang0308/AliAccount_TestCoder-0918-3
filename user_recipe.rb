# Recipe to create a user

user 'new_user' do
  comment 'A new user account'
  uid 1234
  gid 'users'
  home '/home/new_user'
  shell '/bin/bash'
  password '$1$some_hash$some_hash_value' # This should be a real hash
  action [:create, :manage]
end
