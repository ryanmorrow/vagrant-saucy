
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Enable the Puppet provisioner, with will look in manifests
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file = "default.pp"
    puppet.module_path = "modules"
  end

  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
  end

  # Add the box version
  config.vm.box = "ubuntu_saucy_64_x86"
  config.vm.box_url = "http://glazzies.net/ubuntu_saucy_64_x86.box"

  # Create a private network
  # config.vm.network :private_network, ip: "192.168.44.10"

  # Or,
  # Run vm on lan
  config.vm.network "public_network", :bridge => 'eth0', :mac => "5CA1AB1E0001"


  # Forward guest port 80 to host port 8888 and name mapping
  config.vm.network :forwarded_port, guest: 80, host: 8888

  # config.vm.synced_folder "./www/", "/var/www/", :owner => "www-data"

  config.vm.provision :shell, :path => 'manifests/bootstrap.sh'

end
