#!/bin/sh

# Run selenium server for AJAX
DISPLAY=:99.0 java -jar $WORKSPACE/selenium-server.jar -p 4444 &
sleep 10

# Run behat tests
cd $WORKSPACE/build/profiles/$PROJECT_NAME/tmp/tests/behat
touch behat.local.yml
./bin/behat

# Run CasperJS
DISPLAY=:99.0 . $WORKSPACE/casperjs/bin/casperjs test $WORKSPACE/build/$PROJECT_NAME/tmp/tests/casperjs/
