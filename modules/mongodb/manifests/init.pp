class mongodb {

  # package install list
  $packages = [
    "mongodb",
  ]

  # install packages
  package { $packages:
    ensure => present,
    require => Exec["apt-get update"]
  }
}
