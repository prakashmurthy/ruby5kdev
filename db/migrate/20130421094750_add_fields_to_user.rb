class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :running_in_pune, :boolean
    add_column :users, :runner_level, :string
    add_column :users, :runner_goal, :string
    
  end
end
