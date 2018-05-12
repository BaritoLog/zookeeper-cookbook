#
# Cookbook:: zookeeper-cookbook
# Attribute:: default
#
# Copyright:: 2018, BaritoLog.
#
#

cookbook_name = 'zookeeper-cookbook'

# User and group of zookeeper process
default[cookbook_name]['user'] = 'zookeeper'
default[cookbook_name]['group'] = 'zookeeper'

