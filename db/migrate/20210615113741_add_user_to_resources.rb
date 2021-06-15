class AddUserToResources < ActiveRecord::Migration[6.1]
  def change
    add_reference :resources, :user, foreign_key: true
  end
end
