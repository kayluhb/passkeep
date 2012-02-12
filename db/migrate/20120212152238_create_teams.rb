class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :guid, :limit => 36
      t.string :name

      t.timestamps
    end
  end
end
