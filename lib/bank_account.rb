require 'pry'
class BankAccount

attr_reader :name
attr_accessor :account, :status, :balance

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
    @balance += amount
    # binding.pry
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    # binding.pry
    if status == "open" && balance > 0
      true
    else
      false
    end
  end

  def close_account
    @status="closed"
  end
end
