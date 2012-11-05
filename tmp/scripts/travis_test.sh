#!/bin/sh
sh -e /etc/init.d/xvfb start
sleep 3 # give xvfb some time to start
sudo drush @$PROJECT_NAME.local runserver --server=builtin 80 &
sleep 3 # give xvfb some time to rebuild

DISPLAY=:99.0 java -jar $WORKSPACE/selenium-server.jar -p 4444 &
sleep 10
cd $WORKSPACE/build/profiles/$PROJECT_NAME/tmp/tests/behat
touch behat.local.yml
./bin/behat
