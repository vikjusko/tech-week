class Account
	attr_reader :balance, :activity

	def initialize
		@balance = 0
		@activity = []
	end 

	def withdraw(credit)
		@balance -= credit
	end 
end
