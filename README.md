
# Netshow
---------------------------

## Pre-requisites

* Ruby 2.6.5
* Bundler 2.1.4
* Rails 6.0.3.1
* Postgresql 10.10 or later

## Setup

1. `$ git clone https://github.com/raicg/netshow`
1. `$ cd netshow`
1. `$ cp config/database.yml.sample config/database.yml`
1. `$ cp .env.sample .env`
1. `$ bundle install`
1. `$ yarn install`

To continue you will need to open an postgresql server and update the config/database.yml file.

Then:

1. `$ bundle exec rails db:create`
1. `$ bundle exec rails db:migrate`

And now you are able to start the rails server

1. `$ bundle exec rails s`
