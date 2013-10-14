class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :name
      t.string :content
      t.integer :theme_id

      t.timestamps
    end
  end
end
