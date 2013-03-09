# Chef Cookooks for PrePAN

## Setup

### Ruby Libraries

You have to the gem libraries listed below:

  * knife-solo
  * librarian
  * vagrant
  * ec2ssh

```sh
$ gem install knife-solo librarian vagrant ec2ssh
```

### Vagrant

Add the config to your `~/.ssh/config` to enable SSH login:

```
Host 192.168.33.*
  IdentityFile ~/.vagrant.d/insecure_private_key
```

## Provision a Host for Development



## Provision Hosts on Production (EC2)

