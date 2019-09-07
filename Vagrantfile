# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrant multi-machine sample setup
N=2
Vagrant.configure("2") do |config|
  config.vm.define :master do |master|
    master.vm.provision :shell, path: "provision.sh"
    master.vm.box = "ubuntu/bionic64"
    master.vm.network :private_network, ip: "192.168.50.10"
    master.vm.hostname = "master"
    master.vm.provider :virtualbox do |vb|
        # Don't boot with headless mode
        #   vb.gui = true
        # Use VBoxManage to customize the VM. For example to change memory:
        vb.customize [
          'modifyvm', :id,
          '--natdnshostresolver1', 'on',
          '--memory', '1024',
          '--cpus', '2'
        ]
    end

  end
 (1..N).each do |i|
    config.vm.define :worker1 do |worker1|
      worker1.vm.provision :shell, path: "provision.sh"
      worker1.vm.box = "ubuntu/bionic64"
      worker1.vm.network :private_network, ip: "192.168.50.#{i+10}"
      worker1.vm.hostname = "node-#{i}"
      worker1.vm.provider :virtualbox do |vb|
          # Don't boot with headless mode
          #   vb.gui = true
          # Use VBoxManage to customize the VM. For example to change memory:
          vb.customize [
            'modifyvm', :id,
            '--natdnshostresolver1', 'on',
            '--memory', '1024',
            '--cpus', '1'
          ]
      end

    end
  end
  config.vm.define :player do |player|
    player.vm.provision :shell, path: "provision-player.sh"
    player.vm.box = "ubuntu/bionic64"
    player.vm.network :private_network, ip: "192.168.50.14"
    player.vm.hostname = "player"
    player.vm.provider :virtualbox do |vb|
        # Don't boot with headless mode
        #   vb.gui = true
        # Use VBoxManage to customize the VM. For example to change memory:
        vb.customize [
          'modifyvm', :id,
          '--natdnshostresolver1', 'on',
          '--memory', '1024',
          '--cpus', '1'
        ]
    end

  end


end
