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

