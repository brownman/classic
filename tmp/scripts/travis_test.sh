#!/bin/sh
export DISPLAY=:99.0
sh -e /etc/init.d/xvfb start
sleep 3 # give xvfb some time to start
cd $WORKSPACE/drupal
sudo drush runserver --server=builtin 80 &
sleep 3 # give xvfb some time to rebuild

wget http://selenium.googlecode.com/files/selenium-server-standalone-2.25.0.jar
java -jar selenium-server-standalone-2.25.0.jar -p 4444 &
sleep 5
cd $WORKSPACE/drupal/profiles/$PROJECT_NAME/tmp/tests/behat
touch behat.local.yml
./bin/behat
