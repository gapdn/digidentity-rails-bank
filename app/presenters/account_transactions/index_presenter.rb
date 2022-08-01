# frozen_string_literal: true

module AccountTransactions
  class IndexPresenter
    def initialize(account_id)
      @account_id = account_id
    end

    def transactions
      outgoing_transactions.concat(incoming_transactions).sort_by { |transaction| transaction[:created_at] }
    end

    private

    attr_reader :account_id

    def outgoing_transactions
      @outgoing_transactions ||= current_account.outgoing_transactions.map do |transaction|
        transaction.attributes.symbolize_keys.merge!(balance: transaction['sender_account_balance'])
      end
    end

    def incoming_transactions
      @incoming_transactions ||= current_account.incoming_transactions.map do |transaction|
        transaction.attributes.symbolize_keys.merge!(balance: transaction['receiver_account_balance'])
      end
    end

    def current_account
      @current_account ||= Account.find(account_id)
    end
  end
end
