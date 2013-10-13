class RenamePagesToTemplates < ActiveRecord::Migration
  def change
  	rename_table :pages, :templates
  	add_column :templates, :type, :string
  end
end
