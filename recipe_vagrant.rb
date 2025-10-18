# Recipe to install a package using Chef
#
# This recipe installs the 'git' package as an example.
# You can modify the package name as needed.

package 'git' do
  action :install
end