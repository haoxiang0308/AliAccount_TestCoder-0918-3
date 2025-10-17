# Chef recipe to install git package

package 'git' do
  action :install
end

# Print a message after installation
ruby_block 'print_message' do
  block do
    puts "Git package has been installed successfully!"
  end
  action :run
end