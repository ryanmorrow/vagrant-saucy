class php {

  # package install list
  $packages = [
    "php5",
    "php5-cli",
    "php5-mysql",
    "php-pear",
    "php5-dev",
    "php5-gd",
    "php5-mcrypt",
    "libapache2-mod-php5",
    "php5-curl",
    "php5-memcache",
    "php5-xsl",
    "php-apc",
  ]

  # Write apc.ini file
   file { "/etc/php5/mods-available/apc.ini":
     ensure => present,
     source => "/vagrant/modules/php/conf/apc.ini",
     require => Package["php-apc"],
     owner => "root",
     group => "root",
     mode => 644,
   }


  package { $packages:
    ensure => present,
    require => Exec["apt-get update"]
  }
}
