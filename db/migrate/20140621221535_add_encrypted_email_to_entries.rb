class AddEncryptedEmailToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :encrypted_email, :string
  end
end
