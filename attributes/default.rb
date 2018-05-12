#
# Cookbook:: zookeeper-cookbook
# Attribute:: default
#
# Copyright:: 2018, BaritoLog.
#
#

cookbook_name = 'zookeeper-cookbook'

# Cluster configuration with cluster-search
# Role used by the search to find other nodes of the cluster
default[cookbook_name]['role'] = cookbook_name
# Hosts of the cluster, deactivate search if not empty
default[cookbook_name]['hosts'] = []
# Expected size of the cluster. Ignored if hosts is not empty
default[cookbook_name]['size'] = 3

# User and group of zookeeper process
default[cookbook_name]['user'] = 'zookeeper'
default[cookbook_name]['group'] = 'zookeeper'

# zookeeper version
default[cookbook_name]['version'] = '3.4.12'
version = node[cookbook_name]['version']
# package sha256 checksum
default[cookbook_name]['checksum'] =
  'c686f9319050565b58e642149cb9e4c9cc8c7207aacc2cb70c5c0672849594b9'

# Where to get the zip file
binary = "zookeeper-#{version}.tar.gz"
default[cookbook_name]['mirror'] =
  "http://archive.apache.org/dist/zookeeper/zookeeper-#{version}/#{binary}"

# Installation directory
default[cookbook_name]['prefix_root'] = '/opt'
# Where to link installation dir
default[cookbook_name]['prefix_home'] = '/opt'
# Where to link binaries
default[cookbook_name]['prefix_bin'] = '/opt/bin'

