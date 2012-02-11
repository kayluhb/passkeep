# == Schema Information
#
# Table name: entries
#
#  id                 :integer         not null, primary key
#  guid               :string(36)
#  title              :string(255)     not null
#  encrypted_username :string(255)
#  encrypted_password :string(255)
#  encrypted_url      :string(255)
#  encrypted_notes    :text
#  expiration         :datetime
#  attachment_uid     :string(255)
#  attachment_name    :string(255)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#

class Entry < ActiveRecord::Base

  #versioned
  image_accessor :attachment

  # Setup accessible (or protected) attributes for your model
  attr_accessible :title, :username, :password, :url, :notes, :expiration,
                  :attachment, :tag_tokens, :team_tokens
  attr_encrypted :username, :key => Settings.entry.username
  attr_encrypted :password, :key => Settings.entry.password
  attr_encrypted :url, :key => Settings.entry.url
  attr_encrypted :notes, :key => Settings.entry.notes

  before_validation :make_guid

  validates :title, :presence => true

  def to_param
    self.guid
  end

  private
    def make_guid
      self.guid = UUIDTools::UUID.random_create.to_s if guid.blank?
    end

end
