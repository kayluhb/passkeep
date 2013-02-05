class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :guid, limit: 36, null: false
      t.string :name, null: false
      t.boolean :master, default: false
      t.integer :role_id, null: false, default: 1

      t.timestamps
    end
    add_index :teams, :role_id
    add_index :teams, :guid, unique: true
  end
end
