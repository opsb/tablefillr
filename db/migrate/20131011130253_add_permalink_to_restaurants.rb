class AddPermalinkToRestaurants < ActiveRecord::Migration
  def change
  	add_column :restaurants, :permalink, :string
  end
end
