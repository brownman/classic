#!/bin/sh

# Create MySQL Database
mysql -e "create database $PROJECT_NAME;"

# Install Drush
pear channel-discover pear.drush.org
pear install drush/drush-$DRUSH_VERSION
phpenv rehash
