class CreatePrivatemessagings < ActiveRecord::Migration[6.1]
  def change
    create_table :privatemessagings do |t|
      t.references :recipient, index: true
      t.references :sender, index: true
      
      t.timestamps
    end
  end
end
