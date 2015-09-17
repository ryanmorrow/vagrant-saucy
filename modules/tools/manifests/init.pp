class tools {

  # package install list
  $packages = [
    "curl",
    "vim",
    "vifm",
    "htop",
    "git",
    "build-essential",
    "make",
    "libpcre3-dev",
    "postfix",
  ]

  # install packages
  package { $packages:
    ensure => present,
    require => Exec["apt-get update"]
  }
}
