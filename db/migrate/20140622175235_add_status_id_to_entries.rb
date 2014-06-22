class AddStatusIdToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :status_id, :integer, default: 1
  end
end
