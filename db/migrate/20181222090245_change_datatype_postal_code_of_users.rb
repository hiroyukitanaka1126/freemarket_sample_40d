class ChangeDatatypePostalCodeOfUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :postal_code, :string
    change_column :users, :phone_number, :string
  end
end
