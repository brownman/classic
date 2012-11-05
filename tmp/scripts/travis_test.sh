#!/bin/sh
DISPLAY=:99.0 java -jar $WORKSPACE/selenium-server.jar -p 4444 &
sleep 10
cd $WORKSPACE/build/profiles/$PROJECT_NAME/tmp/tests/behat
touch behat.local.yml
./bin/behat
