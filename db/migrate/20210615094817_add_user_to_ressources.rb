class AddUserToRessources < ActiveRecord::Migration[6.1]
  def change
    add_reference :ressources, :user, foreign_key: true
  end
end
