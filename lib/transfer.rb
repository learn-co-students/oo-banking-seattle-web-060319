class Transfer
  attr_reader :sender, :receiver
  attr_accessor :amount, :status

  @@all = []
  
  def initialize(sender, receiver, amount, status = "pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
    @@all << self
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    if @status == "pending" && @sender.balance >= @amount
      receiver.deposit(@amount)
      sender.deposit(@amount * -1)
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.deposit(@amount)
      receiver.deposit(@amount * -1)
      self.status = "reversed"
    end
  end

  def self.all
    @@all
  end
end
