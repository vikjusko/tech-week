require 'account'
describe Account do
  let(:account) { described_class.new }
  context ' initializing the class' do
    it 'Has an initial balance of zero' do
      expect(account.balance).to eq 0
    end
  end
end
