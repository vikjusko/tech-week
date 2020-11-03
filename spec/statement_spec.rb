require "./lib/statement.rb"
describe Statement do 
	let(:account) { Account.new }
	subject(:statement) { described_class.new }

	it "can print out the account transactions in a needed format" do
  	expect(statement.print).to eq ("date || credit || debit || balance\n03/11/2020 || 20.00 || || -20.00")
	end

	it "can store transactions from an assigned account" do
		account.deposit(1500)
  	expect(statement.transaction_list(account.activity)).to eq ["03/11/2020 || || 1500.00 || 1500.00"]
	end
	

end 