Ansible Role - SSH Config: Changelog
====================================
A list of all the changes made to this repo and the role it contains

Version 1.6.0
-------------

1. Test Kitchen removed
2. Added Ubuntu 26.04 support
3. Removed support for anything below 24.04
   1. Role now assumes Ubuntu only without running checks
4. Removed deprecated directives
5. Updated directives
   1. `ChallengeResponseAuthentication` replaced with `KbdInteractiveAuthentication`
   2. `PermitRootLogin without-password` replaced with the current `prohibit-password` spelling
6. Removed `PubkeyAcceptedAlgorithms +ssh-rsa`
   1. RSA keys are still accepted, now signed with SHA-2 rather than SHA-1
7. Modernized the cipher, key exchange and MAC lists on both profiles
   1. Post-quantum `mlkem768x25519-sha256` is used on Ubuntu 26.04 and newer
   2. `diffie-hellman-group14-sha1` removed
8. `sshd -t` now validates the config before it is written
9. All tasks now use fully qualified collection names
10. Ubuntu's dynamic motd is now suppressed
    1. Scripts in `/etc/update-motd.d/` have their execute bit removed
    2. `ssh_config.motd_keep` controls the exceptions and defaults to `98-reboot-required`
    3. The `motd-news` fetcher is disabled and its timer masked

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
