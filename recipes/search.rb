#
# Cookbook:: zookeeper
# Recipe:: search 
#
# Copyright:: 2018, BaritoLog.
require 'json'
require_relative '../libraries/yggdrasil'

# Don't continue if these variables are empty
node.run_state[cookbook_name] ||= {}
if node[cookbook_name]['hosts'].empty? || !node[cookbook_name]['my_id'].is_a?(Integer)
  node.run_state[cookbook_name]['abort?'] = true
  return
end

if node[cookbook_name]['yggdrasil']['enabled']
  yggdrasil_host = node[cookbook_name]['yggdrasil']['host']
  yggdrasil_api_version = node[cookbook_name]['yggdrasil']['api_version']
  yggdrasil_token = node[cookbook_name]['yggdrasil']['token']
  yggdrasil_namespace = node[cookbook_name]['yggdrasil']['namespace']
  yggdrasil_overrides = node[cookbook_name]['yggdrasil']['overrides']

  yggdrasil = Yggdrasil.new(yggdrasil_host,yggdrasil_api_version,yggdrasil_token)
  yggdrasil_config = yggdrasil.fetch_configs(yggdrasil_namespace,yggdrasil_overrides)

  config = JSON.parse(yggdrasil_config["#{cookbook_name}_config"])
  node.run_state[cookbook_name]['hosts'] ||= {}
  node.run_state[cookbook_name]['hosts'] = config
else
  node.run_state[cookbook_name]['hosts'] = node[cookbook_name]['hosts']
end

node.run_state[cookbook_name]['my_id'] = node[cookbook_name]['my_id']
