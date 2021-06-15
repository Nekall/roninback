class CreateJoinTableResourcesTechnologies < ActiveRecord::Migration[6.1]
  def change
    create_join_table :resources, :technologies do |t|
      t.index [:resource_id, :technology_id]
      t.index [:technology_id, :resource_id]
    end
  end
end
