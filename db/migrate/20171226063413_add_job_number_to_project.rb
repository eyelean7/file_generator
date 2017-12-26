class AddJobNumberToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :job_number, :string
  end
end
