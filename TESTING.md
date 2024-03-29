Ansible Role - SSH Config: Testing
===================================
All Route 1337 LLC Ansible roles are tested via Test Kitchen.

Testing with Test Kitchen?
--------------------------
Yes. Normally Test Kitchen is a Chef thing, but we found it to be very useful for testing Ansible roles as well.  
We're using Inspec with Test Kitchen to achieve a test environment that we can use not only during role development, but also
during CI/CD pipelines involving Ansible, and directly against live servers if needed.  


Setting up the test environment
-------------------------------
In order to configure the test environment you will need a few prerequisites. We are assuming you are on a Mac but these instructions
are largely the same for Linux.

1. Install the Ruby virtual environment tools via `brew install rbenv ruby-build`
2. Install the Ansible linting tool via `brew install ansible-lint`
3. Configure a Ruby 3.1.2 virtual environment via `rbenv install 3.1.2`
4. Set it to be the default via `rbenv global 3.1.2`
5. Add the following to your `~/.profile`
    ```
    rubydev()
    {
    if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
    }
    ```
6. Enter the Ruby virtual environment via `rubyenv` (Re-source your .profile first)
7. Then just `gem install bundler && bundle install` while in the repo root.
8. Make sure you have AWS credentials for the default profile with active API access
9. For Ubuntu 22.04+ you will need a custom AMI that has RSA enabled for sshd until Vagrant is updated
10. Now try `kitchen list` to see the roles available for testing.

Testing against production
--------------------------
You can test against any server (production or not) that you can SSH to using the `inspec` command directly via `inspec exec test/smoke/<ROLE>/default --sudo -t ssh://<YOUR USERNAME>@172.16.2.143`

Testing Requirements
--------------------
All roles tested this way must follow these testing rules:

1. All roles must have accompanying Inspec tests that fully test their actions.
2. Sample data should be used to verify that templates fill properly.
3. All supported operating systems should be tested against.
4. Code should pass `ansible-lint /path/to/role`

Return to [README](README.md)
