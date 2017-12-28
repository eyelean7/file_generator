class SeparateAddressInProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :street, :string
    add_column :projects, :line2, :string
    add_column :projects, :city, :string
    add_column :projects, :state, :string
    add_column :projects, :zip, :string
  end
end
