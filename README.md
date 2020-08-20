# README

Place-Sharing Rails application

Requirements specification:

### Ruby version:
- 2.7.1

### Rails version:
- 6

### System dependencies
- yarn (^1.22.4)
- bundle (^2.1.4)

### Configuration
- Clone this repository
- Copy .env.example and paste it as .env
- Fill in all required credentials (DB name, username, password, host, port for [dev, test, prod])
- Run `bundle install` to install all required libraries
- Run `yarn install` to add all required libraries

### Database creation
- Before running the app, create the database first (`rake db:create`)

### Database initialization
- Migrate all tables (`rake db:migrate`)
- Seed all required data (`rake db:seed`)

### How to run the test suite
- This app uses RSpec for unit testing
- Execute `rspec` or `bundle exec rspec` to run all unit tests defined here