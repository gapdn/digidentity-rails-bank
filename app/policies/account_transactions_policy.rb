# frozen_string_literal: true

class AccountTransactionsPolicy < BasePolicy
  def initialize(user, account_id)
    @user = user
    @account_id = account_id
  end

  def can_show_for?
    user.accounts.ids.include?(account_id.to_i)
  end

  private

  attr_reader :user, :account_id
end
