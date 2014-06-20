class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :guid, limit: 36, null: false, index: true
      t.string :name
      t.integer :status_id, default: 1

      t.timestamps
    end
  end
end
