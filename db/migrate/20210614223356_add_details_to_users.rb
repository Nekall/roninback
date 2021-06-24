class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string, :null => false, :default => "Ronin" + Faker::Number.number(digits: 5).to_s;
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :mentor_level, :integer, :null => false, :default => 0
    add_column :users, :is_admin, :boolean, :null => false, :default => false
  end
end
