class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :theme_id
      t.string :name
      t.text :body

      t.timestamps
    end
  end
end
