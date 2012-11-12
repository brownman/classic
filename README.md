# Classic

A copy of the Drupal 7 Standard profile, with Behat/Mink testing using Travis CI.

[![Build Status](https://secure.travis-ci.org/myplanetdigital/classic.png)](http://travis-ci.org/myplanetdigital/classic)

## Installation

    # Create Drupal codebase
    git clone https://github.com/sprice/classic.git
    mkdir profiles
    mv classic profiles/
    mkdir public_html
    mv profiles public_html/
    cd public_html
    drush make --prepare-install profiles/classic/build-classic.make --yes

    # Install Drupal
    drush si classic --sites-subdir=default --db-url=mysql://USERNAME:PASSWORD@localhost/DB_NAME --account-name=admin --account-pass=classic --site-mail=admin@example.com --site-name="Drupal Classic Profile" --yes

    # Install testing tools
    cd profiles/classic/tests/behat
    curl -s http://getcomposer.org/installer | php
    php composer.phar install

##### Configure Behat
Modify `/profiles/classic/tests/behat/behat.yml`
Set `base_url` to your local host

    # Run tests
    cd /profiles/classic/tests/behat
    ./bin/behat

Create `behat.local.yml` from the example file and set your drush alias for the site.

## Files of note

* [travis.yml](https://github.com/sprice/classic/blob/master/.travis.yml)
* [behat.yml](https://github.com/sprice/classic/blob/master/tests/behat/behat.yml)
* [index.features](https://github.com/sprice/classic/blob/master/tests/behat/features/index.feature)
