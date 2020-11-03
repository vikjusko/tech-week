# frozen_string_literal: true

require 'account'
describe Account do
  let(:account) { described_class.new }
  context ' initializing the class' do
    it 'Has an initial balance of zero' do
      expect(account.balance).to eq 0
    end

    it 'has an initial activity log that is an empty array' do
      expect(account.activity).to be_an Array
      expect(account.activity).to be_empty
    end
  end

  context 'money withdrawl' do
    it 'can take money out of the account and reflect it in the current balance amount' do
      account.withdraw(25.00)
      expect(account.balance).to eq(-25.00)
    end

    it 'stores the history of the credit into the activity log' do
      account.withdraw(90.00)
      expect(account.activity).to eq ['03/11/2020 || 90.00 || || -90.00']
    end

    it 'stores the hostry of the credit into the activity log several times in correct order' do
      account.withdraw(120.00)
      account.withdraw(90.00)
      expect(account.activity).to eq ['03/11/2020 || 90.00 || || -210.00', '03/11/2020 || 120.00 || || -120.00']
    end
  end

  context 'one can deposit moeny into the account' do
    it 'can debit money into the account and the amount will be reflected in the balance' do
      account.deposit(1500.00)
      expect(account.balance).to eq(1500.00)
    end

    it 'can add the history of debiting money into the array of activity' do
      account.deposit(1500.00)
      expect(account.activity).to eq ['03/11/2020 || || 1500.00 || 1500.00']
    end
  end

  context 'storing credit and debit information' do
    it 'is able to store acitivty information in order and updates balance correctly' do
      account.deposit(1500.00)
      account.withdraw(500.00)
      account.withdraw(100.00)
      account.deposit(250.00)
      expect(account.balance).to eq(1150.00)
      expect(account.activity).to eq ['03/11/2020 || || 250.00 || 1150.00', '03/11/2020 || 100.00 || || 900.00', '03/11/2020 || 500.00 || || 1000.00', '03/11/2020 || || 1500.00 || 1500.00']
    end
  end

  context 'raising error for edge cases' do
    it 'raises an error if an input is a negative number' do
      expect { account.withdraw(-20.00) }.to raise_error('Invalid input')
    end

    it 'raises an error if an input is a negative number' do
      expect { account.deposit(-20.00) }.to raise_error('Invalid input')
    end
  end
end
