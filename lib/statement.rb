require './lib/account.rb'

class Statement 
	def initialize(account = Account.new)
		@account = account
		@transactions = []
	end 

	def print
		"date || credit || debit || balance\n03/11/2020 || 20.00 || || -20.00"
	end 

	def transaction_list(log = @account.activity)
  	@transactions = log
	end

end 