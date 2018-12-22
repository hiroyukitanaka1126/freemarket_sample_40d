class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :postal_code, :integer
    add_column :users, :prefecture, :string, null: false
    add_column :users, :municipality, :string, null: false
    add_column :users, :phone_number, :string
    add_column :users, :address, :string
  end
end
