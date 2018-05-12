# # encoding: utf-8

# Inspec test for recipe zookeeper-cookbook::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  describe group('zookeeper') do
    it { should exist }
  end

  describe user('zookeeper')  do
    it { should exist }
  end
end

describe package('tar') do
  it { should be_installed }
end

describe directory('/opt') do
  its('mode') { should cmp '0755' }
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
end

describe directory('/opt/bin') do
  its('mode') { should cmp '0755' }
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
end

describe file('/opt/zookeeper/zookeeper.jar') do
  its('mode') { should cmp '0664' }
end

describe directory('/var/opt/zookeeper/log') do
  its('mode') { should cmp '0755' }
  its('owner') { should eq 'zookeeper' }
  its('group') { should eq 'zookeeper' }
end

describe directory('/var/opt/zookeeper/lib') do
  its('mode') { should cmp '0755' }
  its('owner') { should eq 'zookeeper' }
  its('group') { should eq 'zookeeper' }
end

describe file('/opt/zookeeper/conf/zoo.cfg') do
  its('mode') { should cmp '0644' }
end

describe file('/opt/zookeeper/conf/log4j.properties') do
  its('mode') { should cmp '0644' }
end

describe file('/var/opt/zookeeper/lib/myid') do
  its('mode') { should cmp '0644' }
end

