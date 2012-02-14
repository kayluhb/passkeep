class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :guid, :limit => 36, :null => false
      t.string :name, :null => false
      t.integer :role_id, :null => false

      t.timestamps
    end
    add_index :teams, :role_id
    add_index :teams, :guid, :unique => true
  end
end
