class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :guid, :limit => 36, :null => false
      t.string :name, :null => false
      t.integer :status_id, :null => false, :default => 1

      t.timestamps
    end
    add_index :projects, :status_id
    add_index :projects, :guid, :unique => true
  end
end
