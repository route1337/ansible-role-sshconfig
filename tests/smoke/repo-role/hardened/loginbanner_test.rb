#
# Project:: Ansible Role - SSH Config
#
# Copyright 2020, Route 1337, LLC, All Rights Reserved.
#
# Maintainers:
# - Matthew Ahrenstein: matthew@route1337.com
#
# See LICENSE
#

# Verify the login banner was deployed properly

if ['ubuntu', 'centos'].include?(os[:name])

  # Check if /etc/issue.net is correct
  describe file('/etc/issue.net') do
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 0644 }
    its('content') { should match /Route 1337, Inc/ } # Verify the default company deployed
    its('content') { should match /WARNING! Private Computer System/ } # Partial match for the one line warning
  end

  # Check if /etc/motd is correct
  describe file('/etc/motd') do
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 0644 }
    it { should_not be_symlink }
    its('content') { should match /Route 1337, Inc/ } # Verify the default company deployed
    its('content') { should match /WARNING! Private Computer System/ } # Partial match for the one line warning
  end

  # Verify update-motd was removed
  describe package('update-motd')do
    it { should_not be_installed }
  end

else
  # Do nothing
end
