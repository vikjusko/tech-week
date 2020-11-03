require 'account'
describe Account do
  let(:account) { described_class.new }
  context ' initializing the class' do
    it 'Has an initial balance of zero' do
      expect(account.balance).to eq 0
		end
		
		it "has an initial activity log that is an empty array" do 
			expect(account.activity).to be_an Array
			expect(account.activity).to be_empty
		end 
	end
	
	context "money withdrawl" do
		it "can take money out of the account and reflect it in the current balance amount" do
  		account.withdraw(25.00)
  		expect(account.balance).to eq(-25.00)
		end
	end 

end
