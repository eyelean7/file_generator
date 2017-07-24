class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :address
      t.string :description
      t.decimal :price
      t.datetime :visit
      t.datetime :call
      t.belongs_to :client, index: true

      t.timestamps
    end
  end
end
