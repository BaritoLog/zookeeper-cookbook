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

# Java package to install by platform
default[cookbook_name]['java'] = {
  'centos' => 'java-1.8.0-openjdk-headless',
  'ubuntu' => 'openjdk-8-jdk-headless'
}

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

# Log directory, empty by default because everything goes to journald
default[cookbook_name]['log_dir'] = '/var/opt/zookeeper/log'

# Data directory
default[cookbook_name]['data_dir'] = '/var/opt/zookeeper/lib'

# Zookeeper configuration
default[cookbook_name]['config'] = {
  'clientPort' => 2181,
  'dataDir' => node[cookbook_name]['data_dir'],
  'tickTime' => 2000,
  'initLimit' => 5,
  'syncLimit' => 2
}

# log4j configuration
# only CONSOLE by default but you can easily add ROLLINGFILE or TRACEFILE
# rubocop:disable Style/FormatStringToken
default[cookbook_name]['log4j'] = {
  'log4j.rootLogger' => 'INFO, CONSOLE',
  'log4j.appender.CONSOLE' => 'org.apache.log4j.ConsoleAppender',
  'log4j.appender.CONSOLE.Threshold' => 'INFO',
  'log4j.appender.CONSOLE.layout' => 'org.apache.log4j.PatternLayout',
  'log4j.appender.CONSOLE.layout.ConversionPattern' =>
    '%d{ISO8601} [myid:%X{myid}] - %-5p [%t:%C{1}@%L] - %m%n',
  'log4j.appender.ROLLINGFILE' => 'org.apache.log4j.RollingFileAppender',
  'log4j.appender.ROLLINGFILE.Threshold' => 'INFO',
  'log4j.appender.ROLLINGFILE.File' =>
    "#{node[cookbook_name]['log_dir']}/zookeeper.log",
  'log4j.appender.ROLLINGFILE.MaxFileSize' => '10MB',
  'log4j.appender.ROLLINGFILE.layout' => 'org.apache.log4j.PatternLayout',
  'log4j.appender.ROLLINGFILE.layout.ConversionPattern' =>
    '%d{ISO8601} [myid:%X{myid}] - %-5p [%t:%C{1}@%L] - %m%n',
  'log4j.appender.TRACEFILE' => 'org.apache.log4j.FileAppender',
  'log4j.appender.TRACEFILE.Threshold' => 'TRACE',
  'log4j.appender.TRACEFILE.File' =>
    "#{node[cookbook_name]['log_dir']}/zookeeper_trace.log",
  'log4j.appender.TRACEFILE.layout' => 'org.apache.log4j.PatternLayout',
  'log4j.appender.TRACEFILE.layout.ConversionPattern' =>
    '%d{ISO8601} [myid:%X{myid}] - %-5p [%t:%C{1}@%L][%x] - %m%n'
}
# rubocop:enable Style/FormatStringToken

# Configure retries for the package resources, default = global default (0)
# (mostly used for test purpose)
default[cookbook_name]['package_retries'] = nil
