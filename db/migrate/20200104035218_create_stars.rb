class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.string :name
      t.string :star_type
      t.integer :distance
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
