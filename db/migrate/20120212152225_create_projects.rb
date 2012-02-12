class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :guid, :limit => 36
      t.string :name, :null => false
      t.integer :status, :default => 1

      t.timestamps
    end
  end
end
