# Create a LAMP development environment on Ubuntu Trusty 64 with Vagrant and Puppet for fun and enlightenment!

## The Heros
None of this would be possible without standing on the shoulders of intellectual giants
* [jrodriguezjr/puppet-lamp-stack](https:github.com/jrodriguezjr/puppet-lamp-stack)
* [PerishableDave/puppet-lamp-stack](https://github.com/PerishableDave/puppet-lamp-stack)
* [jas0nkim/my-vagrant-puppet-lamp](https://github.com/jas0nkim/my-vagrant-puppet-lamp)
* [Puppet Cookbook](http://puppetcookbook.com/posts/creating-a-directory.html)

## Noobs
If you don't know why you want Vagrant, read this [guy's awesome post](https://raw.github.com/mcandre/hello-vagrant/master/README.md).

## Prerequisites
* [Vagrant](http://www.vagrantup.com/)
* [Virtual Box](https://www.virtualbox.org/)
* [Ubuntu 64 Saucy - Puppet and Chef](http://glazzies.net/ubuntu_saucy_64_x86.box)
    MD5 (ubuntu_saucy_64_x86.box) = 54d9739b61151bc7238a735573748a2f

## Configure
First, add the ubuntu trusty box with Vagrant

    % vagrant box add ubuntu/trusty64

Then, download my vagrant/puppet scripts:

    % git clone https://github.com/ryanmorrow/vagrant-saucy.git
    % cd vagrant-saucy

Now, you are ready to start your new machine!

    % vagrant up

Once the server is loaded, to login to the vm

    % vagrant ssh


By default you should be able to hit your new server at http[s]://192.168.44.10

That's it! Now, go change the world.  If you would like to try out managing more than one server, [check out the multisite version](https://github.com/ryanmorrow/vagrant-saucy-multi)!

## File Tree

    ├── LICENSE
    ├── README.md
    ├── Vagrantfile
    ├── manifests
    │   ├── bootstrap.sh
    │   └── default.pp
    ├── modules
    │   ├── apache
    │   │   ├── conf
    │   │   └── manifests
    │   │       └── init.pp
    │   ├── bootstrap
    │   │   └── manifests
    │   │       └── init.pp
    │   ├── mysql
    │   │   └── manifests
    │   │       └── init.pp
    │   ├── php
    │   │   └── manifests
    │   │       ├── init.pp
    │   │       ├── pear.pp
    │   │       └── pecl.pp
    │   └── tools
    │       └── manifests
    │           └── init.pp
    └── www
