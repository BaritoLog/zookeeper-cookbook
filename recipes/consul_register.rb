#
# Cookbook:: zookeeper
# Recipe:: consul_register
#
# Copyright:: 2018, BaritoLog.
#
#

config = {
  "name": "#{node['hostname']}-zookeeper",
  "tags": ["app:"],
  "address": node['ipaddress'],
  "port": node[cookbook_name]['config']['clientPort'],
  "service": "zookeeper",
  "meta": {
    "http_schema": "http"
  }
}

consul_register_service "zookeeper" do
  config config
  config_dir  node[cookbook_name]['consul']['config_dir']
  consul_bin  node[cookbook_name]['consul']['bin']
end
