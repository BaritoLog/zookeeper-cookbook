#
# Cookbook:: zookeeper
# Recipe:: consul_register
#
# Copyright:: 2018, BaritoLog.
#
#

config = {
  "Node": node['hostname'],
  "Service": {
    "ID": "#{node['hostname']}-zookeeper",
    "Service": "zookeeper",
    "Tags": ["app:"],
    "Address": node['ipaddress'],
    "Meta": {
        "http_schema": "http"
    },
    "Port": node[cookbook_name]['config']['clientPort']
  },
  "SkipNodeUpdate": true
}

consul_register_service "zookeeper" do
  config config
  config_dir  node[cookbook_name]['consul']['config_dir']
  consul_bin  node[cookbook_name]['consul']['bin']
end
