Ansible Role - SSH Config
=========================
This repo contains the SSH Config (ssh_config) Ansible role.

What this role does
-------------------
This role configures OpenSSH with either a Standard, or Hardened configuration. Additionally, it configures a fancy
motd and issue.net for users that SSH in to the server with a rather boilerplate warning.

1. Configure OpenSSH in either a Standard or Hardened config (The default is Standard)
    1. Standard configuration is SSH key only access with a login banner
    2. Hardened configuration is similar to standard but also:
        1. Disables X11 forwarding
        2. Uses a shorter grace time for login
        3. Disables TCP forwarding
        4. Lowers the maximum authentication attempts
        5. Drops the CTR ciphers and the finite-field Diffie-Hellman key exchanges
        6. Disconnects idle sessions
2. Configure a login banner
    1. Sets the `/etc/motd` file to a standardized login banner
    2. Sets the `/etc/issue.net` file to a standardized login banner
    3. Disables Ubuntu's dynamic motd scripts in `/etc/update-motd.d/` so that advertisements, Ubuntu Pro upsells,
    etc... stay out of the login banner
    4. Disables the `motd-news` fetcher so the host stops phoning home to `motd.ubuntu.com`

Requirements
------------
This role targets Ubuntu 24.04 and newer and assumes Ubuntu without running any distribution checks.

Variables
---------
The following variables are optional:

1. `ssh_config.configuration` - Sets the SSH configuration to `Standard` or `Hardened`. (Default: `Standard`)
2. `ssh_config.orgname` - Sets the company name shown in the login banner. (Default: `Route 1337 LLC`)
3. `ssh_config.motd_keep` - A list of scripts in `/etc/update-motd.d/` to leave enabled. Everything else gets `chmod -x` (Default: `['98-reboot-required']`)

Testing
-------
[TESTING.md](TESTING.md) contains details and instructions for testing.

Donate To Support This Ansible Role
-----------------------------------
Route 1337 LLC's open source code heavily relies on donations. If you find this Ansible role useful, please consider using the GitHub Sponsors button to show your continued support.

Thank you for your support!
