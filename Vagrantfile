# -*- mode: ruby -*-
# vi: set ft=ruby :
 
VAGRANTFILE_API_VERSION = "2"
 
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
 
  config.vm.define "saas" do |config|
  
    config.vm.box = "precise64_ruby193_emacs243_puppet341"
  
    config.vm.hostname = "saas.example.com"
 
    config.vm.network :forwarded_port, guest: 80, host: 4567
 
    config.vm.synced_folder "./saas_ops/", "/etc/puppet/"
  	config.vm.synced_folder "./guest/", "/home/vagrant/host/"
  
    config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--name", "saas", "--memory", "1024"]
    end
  end
end