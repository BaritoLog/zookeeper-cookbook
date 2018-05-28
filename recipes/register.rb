# Cookbook:: zookeeper
# Recipe:: register
#

return if node[cookbook_name]['registered_services'].length > 0

consul_register_service "Register Zookeeper as service in Consul agent" do
  configs     node[cookbook_name]['registered_services']
  config_dir  node['consul']['config_dir']
  exec_file   "#{node['consul']['prefix_home']}/bin/consul"
  user        node['consul']['user']
  group       node['consul']['group']
end
