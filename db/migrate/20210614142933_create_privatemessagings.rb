class CreatePrivatemessagings < ActiveRecord::Migration[6.1]
  def change
    create_table :privatemessagings do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.timestamps
    end
  end
end
