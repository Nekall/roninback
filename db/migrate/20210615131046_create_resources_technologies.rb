class CreateResourcesTechnologies < ActiveRecord::Migration[6.1]
  def change
    create_table :resources_technologies do |t|
      t.references :resource, null: false, foreign_key: true
      t.references :technology, null: false, foreign_key: true

      t.timestamps
    end
  end
end
