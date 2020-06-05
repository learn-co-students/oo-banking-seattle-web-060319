class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount, :balance
  @@all = []

	def initialize(sender, receiver, amount)
		@sender = sender
		@receiver = receiver
		@status = "pending"
		@amount = amount
		@@all << self
	end

	def self.all
		@@all
	end

	def valid?
		if (sender.valid? && receiver.valid?) == true
			return true
		else
			return false
		end
	end

	def execute_transaction
		if !(sender.valid?) || sender.balance <= amount
			@status = "rejected"
			return "Transaction rejected. Please check your account balance."
		elsif status != "complete"
			sender.balance -= amount
			receiver.balance += amount
			@status = "complete"
		end
	end

	def reverse_transfer
		if status == "complete"
			sender.balance += amount
			receiver.balance -= amount
			@status = "reversed"
		end	
	end

end


