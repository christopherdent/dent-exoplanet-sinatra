class CreatePlanets < ActiveRecord::Migration
  def change
    create_table :planets do |t|
      t.string :name
      t.integer :date_discovered
      t.string :discovered_by
      t.string :category
      t.integer :star_id
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
