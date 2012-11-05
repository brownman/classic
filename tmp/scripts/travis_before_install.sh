#!/bin/sh

# Create MySQL Database
mysql -e "CREATE DATABASE $PROJECT_NAME;"

# Install Drush
pear channel-discover pear.drush.org
pear install drush/drush-$DRUSH_VERSION
phpenv rehash

# Download Selenium server
wget -O $WORKSPACE/selenium-server.jar http://selenium.googlecode.com/files/selenium-server-standalone-$SELENIUM_VERSION.jar
