class BankAccount
	attr_reader :name
	attr_accessor :balance, :status
	@@all = []

	def initialize(name)
		@name = name
		@balance = 1000
		@status = "open"
		@@all << self
	end

	def self.all
		@@all
	end

	def deposit(amount)
		if @status == "open"
			@balance = @balance + amount
		end
	end

	def display_balance
		self.balance
		return "Your balance is $#{balance}."
	end

	def valid?
		if self.balance > 0 && status == "open"
			return true
		else
			return false
		end
		
	end

	def close_account
		self.status = "closed"
		return "Your account has been closed."
	end

	

end
