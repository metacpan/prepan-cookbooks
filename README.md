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
Host local.prepan.org
  HostName 127.0.0.1
  User vagrant
  Port 2222
  IdentityFile ~/.vagrant.d/insecure_private_key
```

Then add the line below into your `/etc/hosts`:

```
127.0.0.1 local.prepan.org
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
$ knife solo prepare local.prepan.org
$ knife solo cook local.prepan.org -c config/knife.rb
```

## Provision Hosts on Production (EC2)

Prepare remote host:

```sh
$ knife solo prepare ec2-user@app-1.us-west-1 -i ~/.ssh/prepan.pem
```

Edit `node/${hostname}.json` if it's not thre.

Then provision it:

```sh
$ knife solo cook ec2-user@app-1.us-west-1 -i ~/.ssh/prepan.pem
```
