class video {

  # Install ffmpeg
  $packages = [
    "autoconf",
    "automake",
    "libass-dev",
    "libgpac-dev",
    "libtheora-dev",
    "libvorbis-dev",
    "texi2html",
    "zlib1g-dev",
    "yasm",
    "x264",
    "libmp3lame-dev",
    "libopus-dev",
    "libvpx-dev",
    "libfdk-aac-dev",
    "ffmpeg",
    "libav-tools",
  ]
  # install packages
  package { $packages:
    ensure => present,
    require => Exec["apt-get update"]
  }
  # overwrite ffserver.conf file with custom version
  file { "/etc/ffserver.conf":
   ensure => present,
   source => "/vagrant/modules/video/conf/ffserver.conf",
   require => Package["ffmpeg"],
  }

}
