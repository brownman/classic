#!/bin/sh

# Create MySQL Database
mysql -e 'create database drupal;'

# Install Drush
pear channel-discover pear.drush.org
pear install drush/drush-5.4.0
phpenv rehash

# Run composer
cd ./tmp/tests/behat
composer install
cd ../../

# Install Classic Profile
cd ../
mkdir profiles
mv classic profiles/
mkdir drupal
mv profiles drupal/
cd drupal
drush make --prepare-install profiles/classic/build-classic.make --yes
sudo chmod -R 777 sites/all/modules
drush si classic --sites-subdir=default --db-url=mysql://root:@127.0.0.1/drupal --account-name=admin --account-pass=classic --site-mail=admin@example.com --site-name="Drupal Classic Profile" --yes
drush cc all --yes
cd ../

# Create drush alias
cp drupal/profiles/classic/tmp/tests/behat/classic.aliases.drushrc.php ~/.drush/

