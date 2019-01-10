class ChangeColumnToUser < ActiveRecord::Migration[5.0]
  def up
    change_column :users, :postal_code, :string, null: true
  end
end
