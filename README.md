# Create a LAMP development environment on Ubuntu Saucy 13.10 64 with Vagrant and Puppet for fun and enlightenment!

This is a continuation of virtualbox building for Vagrant and Puppet from my blog post [How to create a Ubuntu 3.10 64 Vagrant box with Virtualbox and Puppet](http://spider.glazzies.net/2014/02/how-to-create-a-ubuntu-3-10-64-vagrant-box-with-virtualbox-and-puppet/).

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
First, download the ubuntu saucy box then add the box to vagrant

  % curl -O http://glazzies.net/ubuntu_saucy_64_x86.box
  % vagrant box add ubuntu_saucy_64_x86.box ubuntu_saucy_64_x86

Then, download my vagrant/puppet scripts:

  % clone https://github.com/ryanmorrow/vagrant-saucy.git
  % cd vagrant-saucy

Now, you are ready to start your new machine!

  % vagrant up

Once the server is loaded, to login to the vm

  % vagrant ssh

That's it! Now, go change the world.

## File Tree

    ├── LICENSE
    ├── README.md
    ├── Vagrantfile
    ├── apache2.conf
    ├── manifests
    │   ├── bootstrap.sh
    │   └── default.pp
    ├── modules
    │   ├── apache
    │   │   ├── conf
    │   │   │   ├── apache2.conf
    │   │   │   └── vagrant_webroot.config
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
