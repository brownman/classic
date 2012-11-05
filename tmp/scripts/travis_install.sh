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
cd ../../../

# Install Classic Profile
cd ../
mv classic profile
drush make --prepare-install profile/build-classic.make $WORKSPACE/drupal --yes
sudo chmod -R 777 sites/all/modules
drush si classic --sites-subdir=default --db-url=mysql://root:@127.0.0.1/drupal --account-name=admin --account-pass=classic --site-mail=admin@example.com --site-name="Drupal Classic Profile" --yes
drush cc all --yes
cd ../

# Create drush alias
cp drupal/profiles/classic/tmp/tests/behat/classic.aliases.drushrc.php ~/.drush/

