# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user_1 = User.new(
  first_name: 'John',
  last_name: 'Doe',
  email: 'john_doe@gmail.com',
  password: '12345678'
)

user_2 = User.new(
  first_name: 'Johana',
  last_name: 'Doe',
  email: 'johana_doe@gmail.com',
  password: '12345678'
)

user_1.accounts.build(
  number: FFaker::Number.number(digits: 16),
  credit: 1000
)

user_2.accounts.build(
  number: FFaker::Number.number(digits: 16),
  credit: 1000
)

user_1.save
user_2.save
