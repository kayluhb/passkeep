class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :guid, :limit => 36, :null => false
      t.string :name, :null => false
      t.integer :status_id, :default => 1, :null => false

      t.timestamps
    end
  end
end
