class User < ActiveRecord::Base
  has_many :sent_transfers, class_name: 'Transfer', foreign_key: 'sender_id'
  has_many :received_transfers, class_name: 'Transfer', foreign_key: 'receiver_id' 
  before_save :default_values

  def default_values
    self.balance = 50000 if self.balance.nil?
  end
end
