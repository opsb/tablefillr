class RenameAssetsNameToPath < ActiveRecord::Migration
  def change
  	rename_column :assets, :name, :path
  end
end
