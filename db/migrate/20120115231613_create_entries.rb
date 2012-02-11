class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :guid, :limit => 36
      t.string :title
      t.string :encrypted_username
      t.string :encrypted_password
      t.string :encrypted_url
      t.text :encrypted_notes
      t.datetime :expiration

      t.string :attachment_file_name
      t.string :attachment_content_type
      t.string :attachment_file_size
      t.datetime :attachment_updated_at

      t.timestamps
    end
  end
end
