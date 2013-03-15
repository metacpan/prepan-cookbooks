# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box       = "centos-6.3"
  config.vm.box_url   = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.3-x86_64-v20130101.box"
  config.vm.host_name = "local.prepan.org"

  config.vm.network :hostonly, "192.168.33.10"
  config.vm.network :bridged

  config.vm.forward_port 8000, 8000
end
