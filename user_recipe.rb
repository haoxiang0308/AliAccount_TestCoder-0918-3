# Chef recipe to create a user

user 'myuser' do
  comment 'My User'
  uid 1234
  gid 'users'
  home '/home/myuser'
  shell '/bin/bash'
  password '$1$somepassword$hash'  # This should be a proper hash in real usage
  action :create
end