#!/bin/sh

# Create MySQL Database
mysql -e 'create database drupal;'

# Install Drush
pear channel-discover pear.drush.org
pear install drush/drush-$DRUSH_VERSION
phpenv rehash
