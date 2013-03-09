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
Host vagrant
  HostName 127.0.0.1
  User vagrant
  Port 2222
  IdentityFile ~/.vagrant.d/insecure_private_key
```

### Chef cookbooks

Download dependent Chef cookbooks with `librarian-chef`:

```sh
$ librarian-chef install
```

## Provision Vagrant

```sh
$ knife solo cook vagrant
```

## Provision Hosts on Production (EC2)

