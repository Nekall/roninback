class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.string :date
      t.string :title
      t.belongs_to :user_1, index: true
      t.belongs_to :user_2, index: true
      t.boolean :validated
      t.timestamps
    end
  end
end