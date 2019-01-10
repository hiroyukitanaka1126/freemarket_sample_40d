class ChangeColumnToUsers < ActiveRecord::Migration[5.0]
  def up
    change_column :users, :first_name, :string, null: false
    change_column :users, :last_name, :string, null: false
    change_column :users, :prefecture, :string, null: false
    change_column :users, :municipality, :string, null: false
    change_column :users, :address, :string, null: false
    change_column :users, :nickname, :string, null: false
  end
end
