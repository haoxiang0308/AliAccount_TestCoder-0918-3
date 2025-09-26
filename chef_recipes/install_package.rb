# Recipe to install a package using Chef

# Example: Install the 'curl' package
package 'curl' do
  action :install
end

# Example: Install the 'vim' package
# package 'vim' do
#   action :install
# end