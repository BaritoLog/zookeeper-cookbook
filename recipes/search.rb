#
# Cookbook:: zookeeper
# Recipe:: search 
#
# Copyright:: 2018, BaritoLog.

# Use ClusterSearch
::Chef::Recipe.send(:include, ClusterSearch)

# Looking for zookeeper nodes
cluster = cluster_search(node[cookbook_name])
node.run_state[cookbook_name] ||= {}
if cluster.nil?
  node.run_state[cookbook_name]['abort?'] = true
  return
end

node.run_state[cookbook_name] = {}
node.run_state[cookbook_name]['hosts'] = cluster['hosts']
node.run_state[cookbook_name]['my_id'] = cluster['my_id']
