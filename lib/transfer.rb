class Transfer
  
  attr_accessor  :status, :amount, :sender, :reciever 
  
  #attr_reader :sender, :receiver 
  
  def initialize(sender,receiver,amount)
    @sender = sender 
    @receiver = receiver 
    @status = "pending"
    @amount = 50
  end 
  
  def valid?
    if 
     @sender.valid? && @receiver.valid?
      true 
    else 
      false 
    end 
  end 
  
  def sender(name)
    BankAccount.all.select {|account| account == @sender}
  end
  
  def receiver(name) 
    BankAccount.all.select {|account| account == @receiver}
  end 
    
  
  def execute_transaction(sender,receiver,amount)
    if @sender.balance > @amount  && @status.valid? == true 
          @sender.balance -= @amount 
          @receiver.balance += @amount
          @status = "Complete"
    elsif @status == "Complete"
          "Transaction already completed."
    else 
          @sender.balance < @amount || @sender.status = "closed"
          @status = "Rejected"
          "Transaction rejected. Please check your account balance."
    end 
  end 
  
  def reverse_transfer 
    if @status == "complete" 
       @sender.balance += @amount 
       @receiver.balance -= @amount 
       @status = "reversed" 
    end 
  end 
  
end 
  
