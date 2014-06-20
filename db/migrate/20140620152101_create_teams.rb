class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :guid, limit: 36, null: false, index: true
      t.string :name
      t.boolean :master, default: false
      t.integer :role_id, default: 1

      t.timestamps
    end
  end
end
