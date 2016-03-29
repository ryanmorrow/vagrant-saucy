
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Enable the Puppet provisioner, with will look in manifests
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file = "default.pp"
    puppet.module_path = "modules"
    puppet.options="--verbose --debug"
  end

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
  end

  # Add the box version
  config.vm.box = "ubuntu/trusty64"


  # Create a private network
   config.vm.network :private_network, ip: "192.168.44.10"

  # Or,
  # Run vm on lan
  # config.vm.network "public_network", :bridge => 'eth0', :mac => "5CA1AB1E0001"

  # set auto_update to false, if you do NOT want to check the correct
  # additions version when booting this machine
  # https://github.com/dotless-de/vagrant-vbguest

  config.vbguest.auto_update = true

  # do NOT download the iso file from a webserver
  config.vbguest.no_remote = true

  # Forward guest port 80 to host port 8888 and name mapping
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 443, host: 8443

  config.vm.synced_folder "./html/", "/var/www/html", :owner => "vagrant"

  config.vm.provision :shell, :path => 'manifests/bootstrap.sh'

end
