# frozen_string_literal: true

describe AccountTransactions::IndexPresenter do
  subject(:presenter) { described_class.new(current_user.accounts.first.id) }

  let!(:current_user) { create(:user, :with_account) }
  let!(:another_user) { create(:user, :with_account) }
  let!(:transaction) do
    create(:account_transaction, sender_account: current_user.accounts.first,
                                 receiver_account: another_user.accounts.first)
  end

  describe '#transactions' do
    it 'returns transactions with correct balance' do
      expect(presenter.transactions.first[:balance]).to eq transaction.sender_account_balance
    end
  end
end
