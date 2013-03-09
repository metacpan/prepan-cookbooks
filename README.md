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

Launch Vagrant at first:

```
$ vagrant up
```

This take a long while at the first time.

Then provision it:

```sh
$ knife solo prepare vagrant
$ knife solo cook vagrant -c config/knife.rb
```

## Provision Hosts on Production (EC2)

