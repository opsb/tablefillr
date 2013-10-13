class RemovePageColumnsFromThemes < ActiveRecord::Migration
  def change
  	remove_column :themes, :home_page
  	remove_column :themes, :food_page
  	remove_column :themes, :location_page
  end
end
