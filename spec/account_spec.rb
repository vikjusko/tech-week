require 'account'
describe Account do
  let(:account) { described_class.new }
  context ' initializing the class' do
    it 'Has an initial balance of zero' do
      expect(account.balance).to eq 0
		end
		
		it "has an initial activity log that is an empty array" do 
			expect(account.activity).to be_an Array
		end 
  end
end
