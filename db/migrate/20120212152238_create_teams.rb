class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :guid, :limit => 36, :null => false
      t.string :name, :null => false

      t.timestamps
    end
  end
end
