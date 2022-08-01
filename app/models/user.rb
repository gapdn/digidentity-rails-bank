# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  has_many :accounts, dependent: :delete_all

  has_many :outgoing_transactions, through: :accounts
  has_many :incoming_transactions, through: :accounts
end
