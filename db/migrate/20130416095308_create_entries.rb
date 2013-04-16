class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.float :distance
      t.integer :time
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end
