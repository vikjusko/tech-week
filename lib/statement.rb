# frozen_string_literal: true

require './lib/account'

class Statement
  attr_reader :transactions, :account

  def initialize(account = Account.new)
    @account = account
    @transactions = []
  end

  def print
    "date || credit || debit || balance\n#{@transactions.join("\n")}"
  end

  def transaction_list(log = @account.activity)
    @transactions = log
  end
end
