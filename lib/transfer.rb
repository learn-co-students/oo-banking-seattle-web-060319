require 'pry'

class Transfer
  attr_accessor :transfer, :sender,:receiver,:amount,:status

  def initialize(sender,receiver,amount, status = "pending")
    @receiver = receiver
    @sender = sender
    @amount = amount
    @status = status
  end
puts 'here'
  def valid?
    receiver.valid?
    sender.valid?
  end

  def execute_transaction
    if !sender.valid?
      @status = "rejected"
      return "Transaction rejected. Please check your account balance"
      binding.pry
    elsif sender.balance < amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif @status == "complete"
      return
    else
    sender.deposit(-amount)
    receiver.deposit(amount)
    @status = "complete"
    end
  end

  def reverse_transfer
   if status == "complete"
     sender.deposit(amount)
     receiver.deposit(-amount)
     @status = "reversed"
   end
  end
end
