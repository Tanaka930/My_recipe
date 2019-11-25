class AddContentToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :content1, :text
    add_column :recipes, :content2, :text
    add_column :recipes, :content3, :text
    add_column :recipes, :content4, :text
  end
end
