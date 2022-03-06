Ansible Role - SSH Config
==========================
This repo contains the SSH Config (ssh_config) Ansible role.

What this role does
-------------------
This role configures OpenSSH with either a Standard, or Hardened configuration. Additionally it configures a fancy
motd and issue.net for users that SSH in to the server with a rather boilerplate warning.

1. Configure OpenSSH in either a Standard or Hardened config (The default is Standard)
    1. Standard configuration is SSH key only access with a login banner
    2. Hardened configuration is similar to standard but also disables the following:
        1. X11 Forwarding
        2. A shorter grace time for login
        3. Disable TCP forwarding
2. Configure a login banner
    1. Sets the `/etc/motd` file to a standardized login banner
    2. Sets the `/etc/issue.net` file to a standardized login banner
    3. Remove the `update-motd` package so that the custom motd doesn't get overridden

Variables
---------
The following variables are optional:

1. `ssh_config.configuration` - Sets the SSH configuration to `Standard` or `Hardened`. If the string does not match `Hardened`
it defaults to the Standard configuration
2. `ssh_config.orgname` - Sets the company name shown in the login banner. If undefined the default is `Route 1337, LLC`

Testing
-------
This role is fully tested via Test Kitchen using sample inventory data contained in this repo.  
[TESTING.md](TESTING.md) contains details and instructions for testing. 

Donate To Support This Ansible Role
-----------------------------------
Route 1337, LLC operates entirely on donations. If you find this Ansible role useful, please consider using the GitHub Sponsors button to show your continued support.

Thank you for your support!

