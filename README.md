# Trubya Rails

Trivia game built with Rails with picture guessing element

Hosted on Heroku: http://trubya-rails.herokuapp.com/

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites
Ruby

Rails

### Running on local machine

First, install the dependencies of the app/set up the database by running the following commands in the root directory:

```
bundle install

rake db:migrate

```


After you have bundle installed, you can now run the rails server with this:

```
rails s
```

Then, please seed the database with the following command:

```
rake db:seed
```

Then, you can navigate to localhost:3000/signup and sign up for a new account. You can also navigate to /admin/login to login to the admin panel with the credentials: 'jimmyc/password'.
