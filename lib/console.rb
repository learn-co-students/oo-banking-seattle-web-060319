require 'pry'
require_relative 'transfer'
require_relative 'bank_account'

account1 = BankAccount.new("account1")
account2 = BankAccount.new("account2")
account3 = BankAccount.new("account3")
transferA = Transfer.new(account1, account2, 1000)
transferB = Transfer.new(account1, account2, 475)
transferC = Transfer.new(account1, account3, 889)



binding.pry