#
# Cookbook:: zookeeper-cookbook
# Recipe:: search 
#
# Copyright:: 2018, BaritoLog.

# Use ClusterSearch
::Chef::Recipe.send(:include, ClusterSearch)

# Looking for zookeeper nodes
zookeeper_cluster = cluster_search(node[cookbook_name])
node.run_state[cookbook_name] ||= {}
if zookeeper_cluster.nil?
  node.run_state[cookbook_name]['abort?'] = true
  return
end

node.run_state[cookbook_name] = {}
node.run_state[cookbook_name]['hosts'] = zookeeper_cluster['hosts']
