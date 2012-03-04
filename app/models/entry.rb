# == Schema Information
#
# Table name: entries
#
#  id                 :integer         not null, primary key
#  project_id         :integer
#  guid               :string(36)      not null
#  title              :string(255)     not null
#  search_text        :string(255)
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

  acts_as_taggable

  belongs_to :project

  # Setup accessible (or protected) attributes for your model
  attr_accessible :title, :username, :password, :url, :notes, :expiration,
                  :attachment, :tag_tokens, :project_id, :tag_list,
                  :retained_attachment

  attr_encrypted :username, :key => Settings.entry.username
  attr_encrypted :password, :key => Settings.entry.password
  attr_encrypted :url, :key => Settings.entry.url
  attr_encrypted :notes, :key => Settings.entry.notes

  image_accessor :attachment

  delegate :name, :guid, :to => :project, :prefix => true

  before_validation :make_guid, :set_search_text

  validates :title, :presence => true
  validates :guid, :presence => true
  validates :project, :presence => true

  def to_param
    self.guid
  end

  private
    def make_guid
      self.guid = UUIDTools::UUID.random_create.to_s if guid.blank?
    end

    def set_search_text
      self.search_text = "#{self.project_name} #{self.title}".downcase
    end

  class << self

    def ordered
      order("entries.title")
    end

    def skinny
      select("entries.title, entries.guid, entries.id, entries.project_id, search_text")
    end
  end

end
