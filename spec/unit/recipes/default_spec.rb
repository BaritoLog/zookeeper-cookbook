#
# Cookbook:: zookeeper
# Spec:: default
#
# Copyright:: 2018, BaritoLog.

require 'spec_helper'
require_relative '../../../libraries/yggdrasil'

describe 'zookeeper::default' do
  context 'When all attributes are default, on Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      mock_result = {zookeeper_hosts: ['zookeeper-01-ubuntu-1804.vagrantup.com', 'zookeeper-02-ubuntu-1804.vagrantup.com']}
      allow_instance_of(Yggdrasil).to receive(:fetch_configs).and_return(mock_result)
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
