# Chef recipe to install a package
# This is a simple recipe that installs the 'curl' package

package 'curl' do
  action :install
end

# You can customize this recipe to install other packages as needed
# For example, you could install multiple packages like this:
#
# %w[git vim curl].each do |pkg|
#   package pkg do
#     action :install
#   end
# end