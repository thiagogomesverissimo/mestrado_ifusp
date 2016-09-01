VAGRANTFILE_API_VERSION = "2"

# https://atlas.hashicorp.com/puppetlabs

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "puppetlabs/debian-8.2-32-nocm"
  #config.vm.box = "puppetlabs/ubuntu-16.04-32-nocm"
  config.vm.hostname = "deploythiago"

  # Configurações no Virtualbox
  config.vm.provider :virtualbox do |v|
    v.name = "deploythiago"
    v.memory = 2048
    v.cpus = 2
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
  end

end
