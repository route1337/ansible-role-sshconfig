#
# Project:: Ansible Role - SSH Config
#
# Copyright 2020, Route 1337 LLC, All Rights Reserved.
#
# Maintainers:
# - Matthew Ahrenstein: matthew@route1337.com
#
# See LICENSE
#

# Verify the OpenSSH Standard configuration was deployed

if ['ubuntu'].include?(os[:name])

  # Test if using the correct protocol
  describe file('/etc/ssh/sshd_config') do
    its('content') { should match /Protocol 2/ }
  end

  # Test if User Privilege Separation is on
  describe file('/etc/ssh/sshd_config') do
    its('content') { should match /UsePrivilegeSeparation yes/ }
  end

  # Test if the Key Regeneration Interval is correct
  describe file('/etc/ssh/sshd_config') do
    its('content') { should match /KeyRegenerationInterval 3600/ }
  end

  # Test if the Server Key is the correct size
  describe file('/etc/ssh/sshd_config') do
    its('content') { should match /ServerKeyBits 2048/ }
  end

  # Test if logs are going to the correct location
  describe file('/etc/ssh/sshd_config') do
    its('content') { should match /SyslogFacility AUTH/ }
  end

  # Make sure the logs are verbose so SSH key fingerprints are included
  describe file('/etc/ssh/sshd_config') do
    its('content') { should match /LogLevel VERBOSE/ }
  end

  # Make sure the Login grace time is proper
  describe file('/etc/ssh/sshd_config') do
    its('content') { should match /LoginGraceTime 120/ }
  end

  # Make sure we only allow root logins with SSH keys only
  describe file('/etc/ssh/sshd_config') do
    its('content') { should match /PermitRootLogin without-password/ }
  end

  # Make sure Strict Mode is on
  describe file('/etc/ssh/sshd_config') do
    its('content') { should match /StrictModes yes/ }
  end

  # Make sure we are using RSA authentication
  describe file('/etc/ssh/sshd_config') do
    its('content') { should match /RsaAuthentication yes/ }
  end

  # Make sure we have public key authentication enabled
  describe file('/etc/ssh/sshd_config') do
    its('content') { should match /PubkeyAuthentication yes/ }
  end

  # Make sure password authentication is off for all SSH users
  describe file('/etc/ssh/sshd_config') do
    its('content') { should match /PasswordAuthentication no/ }
  end

  # Make sure we ignore Rhosts
  describe file('/etc/ssh/sshd_config') do
    its('content') { should match /IgnoreRhosts yes/ }
  end

  # Make sure we don't allow Rhosts authentication
  describe file('/etc/ssh/sshd_config') do
    its('content') { should match /RhostsRsaAuthentication no/ }
  end

  # Make sure host based authentication is off
  describe file('/etc/ssh/sshd_config') do
    its('content') { should match /HostBasedAuthentication no/ }
  end

  # Do not permit empty passwords
  describe file('/etc/ssh/sshd_config') do
    its('content') { should match /PermitEmptyPasswords no/ }
  end

  # Turn off challenge response authentication
  describe file('/etc/ssh/sshd_config') do
    its('content') { should match /ChallengeResponseAuthentication no/ }
  end

  # Allow X11 forwarding
  describe file('/etc/ssh/sshd_config') do
    its('content') { should match /X11Forwarding yes/ }
  end

  # Set the X11 Display offset
  describe file('/etc/ssh/sshd_config') do
    its('content') { should match /X11DisplayOffset 10/ }
  end

  # Make sure motd isn't printed on login
  describe file('/etc/ssh/sshd_config') do
    its('content') { should match /PrintMotd no/ }
  end

  # Print the last login time message
  describe file('/etc/ssh/sshd_config') do
    its('content') { should match /PrintLastLog yes/ }
  end

  # Enable TCP keep alive
  describe file('/etc/ssh/sshd_config') do
    its('content') { should match /TCPKeepAlive yes/ }
  end

  # Use PAM as a user source
  describe file('/etc/ssh/sshd_config') do
    its('content') { should match /UsePAM yes/ }
  end

  # Make sure the login banner is present
  describe file('/etc/ssh/sshd_config') do
    its('content') { should match /Banner \/etc\/issue.net/ }
  end

  # Verify the Cipher Suite choice is present
  describe file('/etc/ssh/sshd_config') do
    its('content') { should match /Ciphers aes128-ctr,aes192-ctr,aes256-ctr/ }
  end

  # Verify the MAC choice is present
  describe file('/etc/ssh/sshd_config') do
    its('content') { should match /MACs hmac-sha2-256,hmac-sha2-512/ }
  end

  # Verify the KexAlgorithms choice is present
  describe file('/etc/ssh/sshd_config') do
    its('content') { should match /KexAlgorithms ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,diffie-hellman-group14-sha1,diffie-hellman-group-exchange-sha256/ }
  end

  # Verify SSH daemon is enabled and running
  describe service('ssh') do
    it { should be_enabled }
    it { should be_running }
  end

  # Check to see if SFTP is configured
  describe file('/etc/ssh/sshd_config') do
    its(:content) { should match /\/usr\/lib\/openssh\/sftp-server/ }
  end

  if os[:release] >= "22.04"
    # Check to see if ssh-rsa keys are permitted again
    describe file('/etc/ssh/sshd_config') do
      its(:content) { should match /PubkeyAcceptedAlgorithms \+ssh-rsa/ }
    end
  end
else
  # Do nothing
end
