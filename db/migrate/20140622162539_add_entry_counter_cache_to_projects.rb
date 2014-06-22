class AddEntryCounterCacheToProjects < ActiveRecord::Migration

  def self.up
    add_column :projects, :entries_count, :integer, default: 0

    Project.reset_column_information
    Project.all.each do |p|
      Project.update_counters p.id, entries_count: p.entries.length
    end
  end

  def self.down
    remove_column :projects, :entries_count
  end
end
