class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.time :date
      t.string :title
      t.belongs_to :mentor, index: true
      t.belongs_to :disciple, index: true
      t.boolean :validated
      t.timestamps
    end
  end
end