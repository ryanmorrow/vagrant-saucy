class apache {

 # package install list
  $packages = [
    "apache2",
    "imagemagick",
  ]

  # install packages
  package { $packages:
    ensure => present,
    require => Exec["apt-get update"]
  }

  # ensures that mode_rewrite is loaded and modifies the default configuration file
  file { "/etc/apache2/mods-enabled/rewrite.load":
    ensure => link,
    target => "/etc/apache2/mods-available/rewrite.load",
    require => Package["apache2"]
  }

  # Check vagrant webroot directory is present
  file { "/vagrant/www":
      ensure => "directory",
  }

  # overwrite apache2.conf file with custom version
   file { "/etc/apache2/apache2.conf":
     ensure => present,
     source => "/vagrant/modules/apache/conf/apache2.conf",
     require => Package["apache2"],
     owner => "root",
     group => "root",
     mode => 644,
   }

  # create directory
  file {"/etc/apache2/sites-enabled":
    ensure => directory,
    recurse => true,
    purge => true,
    force => true,
    before => File["/etc/apache2/sites-enabled/vagrant_webroot.config"],
    require => Package["apache2"],
  }



  # create apache virtual host config
  file { "/etc/apache2/sites-available/vagrant_webroot.config":
    ensure => present,
    source => "/vagrant/modules/apache/conf/vagrant_webroot.config",
    require => Package["apache2"],
  }

  # symlink apache site to the site-enabled directory
  file { "/etc/apache2/sites-enabled/vagrant_webroot.config":
    ensure => link,
    target => "/etc/apache2/sites-available/vagrant_webroot.config",
    require => File["/etc/apache2/sites-available/vagrant_webroot.config"],
    notify => Service["apache2"],
  }

  # starts the apache2 service once the packages are installed, and monitors changes to its configuration files and reloads if nesessary
  service { "apache2":
    ensure => running,
    require => Package["apache2"],
    subscribe => [
      File["/etc/apache2/mods-enabled/rewrite.load"],
      File["/etc/apache2/sites-available/vagrant_webroot.config"]
    ],
  }
}
