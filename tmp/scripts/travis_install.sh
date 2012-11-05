#!/bin/sh

# Install Classic Profile
cd ../
echo "WORKSPACE set to: $WORKSPACE"
mv $PROJECT_NAME profile
drush make --prepare-install profile/build-$PROJECT_NAME.make drupal --yes
cd drupal
drush si $PROJECT_NAME --sites-subdir=default --db-url=mysql://root:@127.0.0.1/$PROJECT_NAME --account-name=admin --account-pass=$PROJECT_NAME --site-mail=admin@example.com --site-name=$PROJECT_NAME --yes
drush cc all --yes

# Run composer
cd $WORKSPACE/drupal/profiles/$PROJECT_NAME/tmp/tests/behat
composer install

# Create drush alias
cp $WORKSPACE/drupal/profiles/$PROJECT_NAME/tmp/tests/behat/$PROJECT_NAME.aliases.drushrc.php ~/.drush/
