class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.string :name
      t.string :star_type
      t.integer :distance

      t.timestamps null: false
    end
  end
end
