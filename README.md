APIUS 2013 Presentation
-----------------------

On July 20th, 2013, I presented "Intro to AMQP, RabbitMQ and usage from Rails" at the APIUS, in Sherbrooke. I presented two Ruby applications: a Rails application and a daemon.

This repository is the Rails application.

How to use, tweak and play
--------------------------

1. Install Ruby 2.0
2. gem install bundler
3. git clone https://github.com:francois/apius-2013-rabbitmq-rails.git apius-rails
4. cd apius-rails
5. bundle
6. bundle exec rails server
7. http://localhost:3000/users/new

The interesting files are:

* app/controllers/users_controller.rb
* lib/messaging_service.rb
