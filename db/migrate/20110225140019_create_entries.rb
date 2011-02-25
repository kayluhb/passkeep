class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.string :title
      t.string :username
      t.string :encrypted_password, :default => "", :null => false
      t.string :password_salt, :default => "", :null => false
      t.string :url
      t.text :notes
      t.datetime :expiration

      t.string :attachment_file_name
      t.string :attachment_content_type
      t.string :attachment_file_size
      t.datetime :attachment_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
