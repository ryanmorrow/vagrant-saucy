#!/bin/bash

if [ ! -f /home/vagrant/.bash_profile ]; then
  ln -s /vagrant/.bash_profile /home/vagrant/.bash_profile
fi

# Copy all sites available files to apache directory and symlink

if [ -d /vagrant/sites-available ];then
  for i in `ls -1 /vagrant/sites-available`; do
    if [ ! -f /etc/apache2/sites-available/${i} ]; then
      cp /vagrant/sites-available/${i} /etc/apache2/sites-available/
    fi
    if [ ! -L /etc/apache2/sites-enabled/${i} ]; then
      ln -s /etc/apache2/sites-available/${i} /etc/apache2/sites-enabled/${i}
    fi
  done
fi