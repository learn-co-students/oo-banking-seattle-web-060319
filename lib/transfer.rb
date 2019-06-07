require 'pry'

class Transfer

	attr_accessor :sender, :receiver, :status
	attr_reader :amount

	def initialize(sender, receiver, status = "pending", amount)
		@sender = sender
		@receiver = receiver
		@status =  status 
		@amount = amount
	end

	def valid?
		if @sender.valid? && @receiver.valid? && @sender.balance > amount
			return true
		else
			return false
		end
	end

	def execute_transaction
		if valid? == true && @status != "complete"
			sender.balance -= @amount
			receiver.balance += @amount
			@status = "complete"
			# binding.pry
		else
			@status = "rejected"
			return "Transaction rejected. Please check your account balance."
		end
	end

	def reverse_transfer
		if valid? == true && @status == "complete"
			sender.balance += @amount
			receiver.balance -= @amount
			@status = "reversed"
		end
	end

end
