require "./lib/statement.rb"
describe Statement do 
subject(:statement) { described_class.new }
	it "can print out the account transactions in a needed format" do
  	expect(statement.print).to eq ("date || credit || debit || balance\n03/11/2020 || 20.00 || || -20.00")
	end
end 