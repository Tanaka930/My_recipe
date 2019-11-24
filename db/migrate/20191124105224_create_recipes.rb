class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.string :image, null: false
      t.text :text, null: false
      t.string :material
      t.string :seasoning
      t.text :my_text, null: false
      t.string :time
      t.string :category 

      t.timestamps
    end
  end
end
