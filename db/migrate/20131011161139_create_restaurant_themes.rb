class CreateRestaurantThemes < ActiveRecord::Migration
  def change
    create_table :restaurant_themes do |t|
      t.integer :restaurant_id
      t.integer :theme_id

      t.timestamps
    end
  end
end
