class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :guid, :limit => 36
      t.string :title, :null => false
      t.string :encrypted_username
      t.string :encrypted_password
      t.string :encrypted_url
      t.text :encrypted_notes
      t.datetime :expiration

      t.string :attachment_uid
      t.string :attachment_name

      t.timestamps
    end
  end
end
