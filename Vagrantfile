# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box       = "centos/6"

  config.vm.hostname = "local.prepan.org"
  config.vm.network :forwarded_port, :guest => 8080, :host => 8080

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end
end
