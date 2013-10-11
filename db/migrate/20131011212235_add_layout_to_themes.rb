class AddLayoutToThemes < ActiveRecord::Migration
  def change
  	add_column :themes, :layout, :text
  end
end
