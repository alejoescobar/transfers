class CreateTransfers < ActiveRecord::Migration
  def change
    create_table :transfers do |t|
      t.integer :sender_id, index: true
      t.integer :receiver_id, index: true
      t.integer :amount

      t.timestamps null: false
    end
  end
  add_foreign_key :transfers, :users, column: :sender_id 
  add_foreign_key :transfers, :users, column: :receiver_id 
end
