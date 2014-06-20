class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :guid, limit: 36, null: false, index: true
      t.string :title, null: false
      t.string :search_text
      t.string :encrypted_username
      t.string :encrypted_password
      t.string :encrypted_url
      t.text :encrypted_notes
      t.string :attachment_uid
      t.string :attachment_name
      t.datetime :expiration
      t.references :project, index: true

      t.timestamps
    end
  end
end
