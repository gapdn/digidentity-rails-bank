# README

The Ruby Bank

## Prerequisites
```
1. Build a simple Rails banking app
2. Via the console you can create users with password
3. Via the console you can give the user credit
4. The user must be able to log in
5. User has a bank account with balance
6. Users can transfer money to each other through the UI
7. Users may not have a negative balance on their account
8. It must be traceable how a user obtained a certain balance
```
## Main system dependencies

- Ruby 3.1.2 (Rails 7.0+)
- PostgreSQL 9.3+

## Local deployment

- Install system dependencies
- Ask credentials keys (development.key, test.key) from repository maintainers and copy them to /config/credentials/*
- Run `bundle exec rails db:create` to create a new database
- Run `bundle exec rails db:migrate` to run all the migrations
- Run `bundle exec rails db:seed` to create test user with account
- Run `bundle install` to setup all the needed gems
- Run `lefthook install` to enable linters running on pre-push, pre-commit hooks
- Run `rails s` to run the appliction

## Linting

- Configuration is placed in `lefthook.yml.` in the root of project
- Lint all the project with `lefthook run all`

## Tests run

- Run unit tests `bundle exec rspec`

## After deploy/run part~~y~~

- After successful run of the project you can sign in with exisitng user data

email: `john_doe@gmail.com`
password: `12345678`
<img width="1436" alt="Screenshot 2022-07-31 at 19 22 02" src="https://user-images.githubusercontent.com/57171830/182038100-477d7b30-9efd-48a5-a761-437ccd7e052d.png">
or create a new user via sign up form
<img width="1436" alt="Screenshot 2022-07-31 at 19 25 57" src="https://user-images.githubusercontent.com/57171830/182038123-202fb313-5c7a-49f0-be8c-69fabbb98a60.png">

- After successful sign in you can create an account

<img width="1440" alt="Screenshot 2022-07-31 at 19 23 19" src="https://user-images.githubusercontent.com/57171830/182038153-b86c9fc5-c45d-404d-97aa-f0ea121ae3dc.png">

- And send money to any existing accounts except yours
<img width="1436" alt="Screenshot 2022-07-31 at 20 25 44" src="https://user-images.githubusercontent.com/57171830/182038209-be026c79-66c9-4a2f-bbd6-5f38ac219cc2.png">

- Show all account transactions
<img width="1436" alt="Screenshot 2022-07-31 at 20 27 39" src="https://user-images.githubusercontent.com/57171830/182038269-64d07cd6-f1b6-4472-9067-5bdbdb8dc513.png">

- Show particular account transaction
<img width="1431" alt="Screenshot 2022-07-31 at 20 28 39" src="https://user-images.githubusercontent.com/57171830/182038297-5841e188-0d30-48cc-a8af-5e15e2d8c58e.png">

- You can face with validation errors in case if try to send more money than you have in your current account or if you try to send a negative amount of money
<img width="1422" alt="Screenshot 2022-07-31 at 20 05 44" src="https://user-images.githubusercontent.com/57171830/182038477-0407dff1-4f35-473b-b6a8-e0fdb788e38c.png">
