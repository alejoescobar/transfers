class Transfer < ActiveRecord::Base
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'

  after_create :transfer_amount
  after_update :update_transfer_amount
  after_destroy :destroy_transfer_amount

  def transfer_amount
    self.sender.update( balance: self.sender.balance -= self.amount )
    self.receiver.update( balance: self.receiver.balance += self.amount )
  end

  def update_transfer_amount
    self.sender.update( balance: self.sender.balance += self.amount_was - self.amount)
    self.receiver.update( balance: self.receiver.balance -= self.amount_was - self.amount )
  end

  def destroy_transfer_amount
    self.sender.update( balance: self.sender.balance += self.amount_was )
    self.receiver.update( balance: self.receiver.balance -= self.amount_was )
  end

end
