#
# Cookbook:: zookeeper-cookbook
# Recipe:: default
#
# Copyright:: 2018, BaritoLog.
#
#

include_recipe "#{cookbook_name}::search"
include_recipe "#{cookbook_name}::user"
include_recipe "#{cookbook_name}::install"
include_recipe "#{cookbook_name}::config"
