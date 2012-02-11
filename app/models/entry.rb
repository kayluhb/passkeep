class Entry < ActiveRecord::Base
  # Setup accessible (or protected) attributes for your model
  attr_accessible :title, :username, :password, :url, :notes, :expiration,
                  :attachment, :tag_tokens, :team_tokens
  attr_encrypted :username, :key => Settings.entry.username
  attr_encrypted :password, :key => Settings.entry.password
  attr_encrypted :url, :key => Settings.entry.url
  attr_encrypted :notes, :key => Settings.entry.notes

  validates :title, :presence => true

end
