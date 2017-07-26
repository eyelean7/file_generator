class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :description
      t.decimal :hours
      t.belongs_to :project, foreign_key: true

      t.timestamps
    end
  end
end
