# frozen_string_literal: true

require './lib/statement'
describe Statement do
  let(:account) { Account.new }
  subject(:statement) { described_class.new }

	it 'can print out the account transactions in a needed format' do
		account.withdraw(20.00)
		statement.transaction_list(account.activity)
    expect(statement.print).to eq("date || credit || debit || balance\n03/11/2020 || 20.00 || || -20.00")
  end

  it 'can store transactions from an assigned account' do
    account.deposit(1500)
    expect(statement.transaction_list(account.activity)).to eq ['03/11/2020 || || 1500.00 || 1500.00']
  end

  it 'can print out the account transactions with a more complex activity history' do
    account.deposit(1500.00)
    account.withdraw(500.00)
    account.withdraw(100.00)
    account.deposit(250.00)
    expect(statement.transaction_list(account.activity)).to eq ['03/11/2020 || || 250.00 || 1150.00', '03/11/2020 || 100.00 || || 900.00', '03/11/2020 || 500.00 || || 1000.00', '03/11/2020 || || 1500.00 || 1500.00']
    expect(statement.print).to eq("date || credit || debit || balance\n03/11/2020 || || 250.00 || 1150.00\n03/11/2020 || 100.00 || || 900.00\n03/11/2020 || 500.00 || || 1000.00\n03/11/2020 || || 1500.00 || 1500.00")
  end
end
