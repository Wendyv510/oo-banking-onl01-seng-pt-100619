class BankAccount
  
  attr_accessor :balance, :status 
  
  attr_reader   :name 
  
  @@all = []
  
  def initialize(name)
    @balance = 1000
    @name = name 
    @status = "open"
    @@all << self 
  end 
  
  def self.all 
    @@all
  end 
  
  def deposit(money_amount)
    @balance += money_amount 
  end 
  
  def display_balance
     "Your balance is $#{@balance}."
  end 
  
  def valid?
    @status == "open" && @balance > 0 ? true : false 
  end 
  
  def close_account 
    @status = "closed"
  end 

end
