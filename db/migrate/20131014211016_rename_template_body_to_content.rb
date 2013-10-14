class RenameTemplateBodyToContent < ActiveRecord::Migration
  def change
  	rename_column :templates, :body, :content
  end
end
