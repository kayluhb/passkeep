class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      t.encryptable
      # t.confirmable
      t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable

      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :guid, :limit => 36, :null => false
      t.string :time_zone, :default => 'Eastern Time (US & Canada)'
      t.boolean :super_user, :default => false

      t.timestamps
    end
    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    add_index :users, :unlock_token,         :unique => true
    # add_index :users, :authentication_token, :unique => true
    add_index :users, :guid, :unique => true
  end
end
