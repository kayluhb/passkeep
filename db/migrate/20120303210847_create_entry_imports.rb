class CreateEntryImports < ActiveRecord::Migration
  def change
    create_table :entry_imports do |t|

      t.references :team
      t.string :attachment_uid
      t.string :attachment_name

      t.timestamps
    end
    add_index :entry_imports, :team_id
  end
end
