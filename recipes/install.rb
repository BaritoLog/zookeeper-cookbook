#
# Cookbook:: zookeeper-cookbook
# Recipe:: install 
#
# Copyright:: 2018, BaritoLog.
#
#

package_retries = node[cookbook_name]['package_retries']

# tar may not be installed by default
package %w[tar] do
  retries package_retries unless package_retries.nil?
end

# Create prefix directories
[
  node[cookbook_name]['prefix_root'],
  node[cookbook_name]['prefix_home'],
  node[cookbook_name]['prefix_bin']
].uniq.each do |dir_path|
  directory "#{cookbook_name}:#{dir_path}" do
    path dir_path
    owner 'root'
    group 'root'
    mode '0755'
    recursive true
    action :create
  end
end

# Install zookeeper package with ark
ark 'zookeeper' do
  action :install
  url node[cookbook_name]['mirror']
  version node[cookbook_name]['version']
  checksum node[cookbook_name]['checksum']
  prefix_root node[cookbook_name]['prefix_root']
  prefix_home node[cookbook_name]['prefix_home']
  prefix_bin node[cookbook_name]['prefix_bin']
  has_binaries [] # zookeeper script does not work when linked
end

# Symbolic link for zookeeper jar to simplify service file
install_dir = "#{node[cookbook_name]['prefix_home']}/zookeeper"
link "#{install_dir}/zookeeper.jar" do
  to "#{install_dir}/zookeeper-#{node[cookbook_name]['version']}.jar"
end
