# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.define :node1 do |node|
    node.vm.box = "generic/ubuntu1804"
    node.vm.hostname = "node1"

    node.vm.network :private_network,
      :ip => "192.168.100.10",
      :libvirt__netmask => "255.255.255.0",
      :libvirt__network_name => 'openstack'

    node.vm.provider :libvirt do |v|
      v.cpus = 2
      v.memory = 4096
      v.qemu_use_session = false
    end
  end

  config.vm.define :node2 do |node|
    node.vm.box = "generic/ubuntu1804"
    node.vm.hostname = 'node2'

    node.vm.network :private_network,
      :ip => "192.168.100.11",
      :libvirt__netmask => "255.255.255.0",
      :libvirt__network_name => 'openstack'

    node.vm.network :private_network,
      :ip => "192.168.2.11",
      :libvirt__netmask => "255.255.255.0",
      :libvirt__network_name => 'backbone',
      :libvirt__forward_mode => "none"

    node.vm.provider :libvirt do |v|
      v.memory = 8192
      v.cpus = 4
      v.storage :file, :size => "50G"
      v.qemu_use_session = false
    end
  end

  config.vm.define :node3 do |node|
    node.vm.box = "generic/ubuntu1804"
    node.vm.hostname = 'node3'

    node.vm.network :private_network,
      :ip => "192.168.100.13",
      :libvirt__netmask => "255.255.255.0",
      :libvirt__network_name => 'openstack'

    node.vm.network :private_network,
      :ip => "192.168.2.13",
      :libvirt__netmask => "255.255.255.0",
      :libvirt__network_name => 'backbone',
      :libvirt__forward_mode =>  "none"

    node.vm.provider :libvirt do |v|
      v.memory = 8192
      v.cpus = 4
      v.storage :file, :size => "50G"
      v.qemu_use_session = false
    end
  end

  config.vm.synced_folder ".", "/vagrant", owner: "vagrant", group: "vagrant", create: true, type: "rsync"

#  config.vm.provision "shell", run: "always" do |s|
#    s.inline = 'sudo sed -i.bak -e "s%http://[^ ]\+%http://ftp.iij.ad.jp/pub/linux/ubuntu/archive/%g" /etc/apt/sources.list'
#  end

end
