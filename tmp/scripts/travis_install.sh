#!/bin/sh

# Install Classic Profile
cd ../
export WORKSPACE=$PWD
echo "WORKSPACE set to: $WORKSPACE"
mv classic profile
drush make --prepare-install profile/build-classic.make drupal --yes
cd drupal
drush si classic --sites-subdir=default --db-url=mysql://root:@127.0.0.1/drupal --account-name=admin --account-pass=classic --site-mail=admin@example.com --site-name="Drupal Classic Profile" --yes
drush cc all --yes

# Run composer
cd $WORKSPACE/drupal/profiles/classic/tmp/tests/behat
composer install

# Create drush alias
cp $WORKSPACE/drupal/profiles/classic/tmp/tests/behat/classic.aliases.drushrc.php ~/.drush/
