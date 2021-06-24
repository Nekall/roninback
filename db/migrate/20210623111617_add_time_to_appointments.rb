class AddTimeToAppointments < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :appointment_time, :string
  end
end
