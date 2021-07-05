require_relative 'bank_account'
class Transfer
  # your code here
require 'pry'
  attr_accessor :sender, :receiver, :amount, :status

@@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @@all << self
  end

  def self.all
    @@all
  end

  def valid?
    # binding.pry
    if @sender.valid? && @receiver.valid? && @sender.balance > amount
      return true
    else
      return false
    end
  end


  def execute_transaction
    if valid? == true && @status != "complete"
      sender.deposit(-@amount)
      receiver.deposit(@amount)
      @status = "complete"

    else valid? == false
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete" && valid?
      sender.deposit(@amount)
      receiver.deposit(-@amount)
      @status="reversed"
    end
  end
end
