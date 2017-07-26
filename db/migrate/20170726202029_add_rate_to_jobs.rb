class AddRateToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :rate, :decimal
  end
end
