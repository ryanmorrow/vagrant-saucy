class mysql {

  # root mysql password
  $mysqlpw = "d3v0p5"

  #Add your custom username
  $customUser = "spider"
  $customPw = "d0rkk!"
  $customAddUserScript = "/vagrant/conf/add.spider.mysql"

  # install mysql server
  package { "mysql-server":
    ensure => present,
    require => Exec["apt-get update"]
  }

  #start mysql service
  service { "mysql":
    ensure => running,
    require => Package["mysql-server"],
  }

  #install memcached
  package { "memcached":
    ensure => present,
    require => Exec["apt-get update"]
  }

  # set mysql password
  exec { "set-mysql-password":
    unless => "mysqladmin -uroot -p$mysqlpw status",
    command => "mysqladmin -uroot password $mysqlpw",
    require => Service["mysql"],
  }

  # Add a custom mysql user
  exec { "add-custom-mysql-user":
    unless => "mysqladmin -u$customUser -p$customPw status",
    command => "mysql -u$customUser -p$customPw < $customAddUserScript",
    require => Service["mysql"],
  }
}
