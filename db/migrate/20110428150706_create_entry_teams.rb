class CreateEntryTeams < ActiveRecord::Migration
  def self.up
    create_table :entry_teams do |t|
      t.references :entry
      t.references :team

      t.timestamps
    end
    add_index :entry_teams, :entry_id
    add_index :entry_teams, :team_id
  end

  def self.down
    drop_table :entry_teams
  end
end
