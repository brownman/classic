#!/bin/sh
export DISPLAY=:99.0
sh -e /etc/init.d/xvfb start
sleep 3 # give xvfb some time to start
sudo drush @classic.local runserver --server=builtin 80 &
sleep 3 # give xvfb some time to rebuild

wget http://selenium.googlecode.com/files/selenium-server-standalone-2.25.0.jar
java -jar selenium-server-standalone-2.25.0.jar -p 4444 &
sleep 5
cd /home/travis/builds/myplanetdigital/drupal/profiles/classic/tmp/tests/behat
echo $PWD
touch behat.local.yml
./bin/behat
