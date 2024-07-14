Ansible Role - SSH Config: Changelog
=====================================
A list of all the changes made to this repo and the role it contains

Version 1.5.1
-------------

1. Fix SSH service name

Version 1.5.0
-------------

1. Added Ubuntu 24.04 support
2. Removed Ubuntu 18.04 support

Version 1.4.0
-------------

1. Added Ubuntu 22.04 support
   1. Adding `PubkeyAcceptedAlgorithms +ssh-rsa` as ssh-rsa keys are still in use in many places.
2. Removed Ubuntu 16.04 support
3. Removed some remnants of CentOS code
4. Kitchen will now use AWS for testing (A change forced by VirtualBox not supporting Apple Silicon)

Version 1.3.0
-------------

1. Adjust SSH config to deny known bad Ciphers, MACs and KexAlgorithms
2. Removed CentOS testing as CentOS is no longer being supported

Version 1.2.2
-------------

1. Adding missing `test-kitchen` gem to Gemfile

Version 1.2.1
-------------

1. Adding Ubuntu 20.04 to metadata file.

Version 1.2.0
-------------

1. Added testing and support for Ubuntu 20.04

Version 1.1.0
-------------

1. Added support for CentOS 7 and 8

Version 0.1.0
-------------

1. Initial Release of repository

Role Changes:

1. Initial release

Return to [README](README.md)
