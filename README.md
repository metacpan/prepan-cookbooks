# Chef Cookbooks for PrePAN

## Setup

### Ruby Libraries

You have to install the gem libraries listed below:

  * knife-solo
  * librarian
  * ec2ssh

the gem libraries except ec2ssh are managed by bundler.  So You can install these libraries by following commands.

```sh
$ gem install ec2ssh
$ gem install bundler
$ bundle install --path vendor/bundle
```

### ec2ssh

Set `profiles` and `regions` in a file named '~/.ec2ssh` as below.

```
profiles 'default', 'prepan'
regions *%w(us-west-1)
```

And set credentials for prepan in `~/.aws/credentials`.

```
[prepan]
aws_access_key_id = your access key
aws_secret_access_key = your secret access key
```

Then setup your `$HOME/.ssh/config`:

```
$ ec2ssh init --path ~/.ssh/config
$ ec2ssh update
```

### Vagrant

You need to install Vagrant by the installer.  You can get it from http://docs.vagrantup.com/v2/installation/index.html .  See also http://docs.vagrantup.com/v2/installation/index.html for details.

Add the config gotten by `vagrant ssh-config` to your `~/.ssh/config` to enable SSH login:

```
vagrant ssh-config --host local.prepan.org >> ~/.ssh/config
```

Then add the line below into your `/etc/hosts`:

```
127.0.0.1 local.prepan.org
```

### Chef cookbooks

Init knife solo.

```sh
$ bundle exec knife solo init .
```

Download dependent Chef cookbooks with `berkshelf`:

```sh
$ bundle exec berks install
```

## Provision Vagrant

Launch Vagrant at first:

```
$ vagrant up
```

This take a long while at the first time.

Then provision it:

```sh
$ bundle exec knife solo prepare local.prepan.org
$ bundle exec knife solo cook local.prepan.org
```

You need `data_bag_key` in the repository root to run `knife solo cook`.

## Provision Hosts on Production (EC2)

Prepare remote host:

```sh
$ bundle exec knife solo prepare ec2-user@app-1.us-west-1 -i ~/.ssh/prepan.pem
```

Edit `node/${hostname}.json` if it's not thre.

Then provision it:

```sh
$ bundle exec knife solo cook ec2-user@app-1.us-west-1 -i ~/.ssh/prepan.pem
```

From the 2nd time, you have to use `deployer` user for login user:

```sh
$ bundle exec knife solo cook deployer@app-1.us-west-1 -i ~/.ssh/prepan.pem
```
