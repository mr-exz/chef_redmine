# # encoding: utf-8

# Inspec test for recipe chef_redmine::default

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

describe bash('/usr/local/rvm/rubies/ruby-2.3.4/bin/ruby -v') do
  its('stdout') { should match "2.3.4" }
  its('exit_status') { should eq 0 }
end

describe service('mariadb') do
  it { should be_enabled }
  it { should be_running }
  it { should be_installed }
end
