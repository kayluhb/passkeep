class CreateEntryTags < ActiveRecord::Migration
  def self.up
    create_table :entry_tags do |t|
      t.references :entry
      t.references :tag

      t.timestamps
    end
    add_index :entry_tags, :entry_id
    add_index :entry_tags, :tag_id
  end

  def self.down
    drop_table :entry_tags
  end
end
