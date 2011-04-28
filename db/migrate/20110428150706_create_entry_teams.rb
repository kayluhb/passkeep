class CreateEntryTeams < ActiveRecord::Migration
  def self.up
    create_table :entry_teams do |t|
      t.references :entry
      t.references :team

      t.timestamps
    end
  end

  def self.down
    drop_table :entry_teams
  end
end
