class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :icon, :string
    add_column :users, :prof, :text
    add_column :users, :birthday, :date
    add_column :users, :gender, :string
  end
end
