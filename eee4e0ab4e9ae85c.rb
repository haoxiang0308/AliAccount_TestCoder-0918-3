# Chef recipe to install a package
#
# This recipe installs the curl package as an example

package 'curl' do
  action :install
end

# You can add more packages as needed
# Example of installing multiple packages:
# %w[git vim curl wget].each do |pkg|
#   package pkg do
#     action :install
#   end
# end