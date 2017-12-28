class SeparateAddressInClient < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :department, :string
    add_column :clients, :billing_street, :string
    add_column :clients, :billing_line2, :string
    add_column :clients, :billing_city, :string
    add_column :clients, :billing_state, :string
    add_column :clients, :billing_zip, :string
  end
end
