class CreateThemes < ActiveRecord::Migration
  def change
 	create_table :themes do |t|
      t.string :name
      t.string :permalink
      t.integer :restaurant_theme_id

      t.text :home_page
      t.text :menu_page
      t.text :location_page

      t.timestamps
    end
  end
end
