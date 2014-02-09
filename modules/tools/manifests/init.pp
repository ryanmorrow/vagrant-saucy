class tools {

  # package install list
  $packages = [
    "curl",
    "vim",
    "htop",
    "git",
    "memcached",
    "build-essential",
    "make",
    "libpcre3-dev",
    "postfix",
    "imagemagick",
  ]

  # install packages
  package { $packages:
    ensure => present,
    require => Exec["apt-get update"]
  }
}
