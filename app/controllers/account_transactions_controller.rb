# frozen_string_literal: true

class AccountTransactionsController < ApplicationController
  before_action :authorize_account, only: %i[index show]
  before_action :account_id, only: %i[index show new]

  def index
    @presenter = AccountTransactions::IndexPresenter.new(params[:account_id])
  end

  def show
    @account_transaction = AccountTransaction.find(params[:id])
  end

  def new
    @account_transaction = AccountTransaction.new
    @presenter = AccountTransactions::CreatePresenter.new(current_user:)
  end

  def create
    result = AccountTransactions::Creator.call(account_transaction_params)
    app_render(result, redirect_url: account_account_transaction_url(result, account_id:), return_action: :new)
  end

  private

  def authorize_account
    return if AccountTransactionsPolicy.can_show_for?(current_user, account_id)

    flash.alert = I18n.t('response.fail.unauthorized', status: :unauthorized)

    redirect_back(fallback_location: root_path)
  end

  def account_transaction_params
    params.require(:account_transaction).permit(
      :sender_account_id,
      :receiver_account_id,
      :sender_account_balance,
      :receiver_account_balance,
      :amount
    )
  end

  def account_id
    @account_id ||= params[:account_id]
  end
end
