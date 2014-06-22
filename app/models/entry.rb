# == Schema Information
#
# Table name: entries
#
#  id                 :integer          not null, primary key
#  guid               :string(36)       not null
#  title              :string(255)      not null
#  search_text        :string(255)
#  encrypted_username :string(255)
#  encrypted_password :string(255)
#  encrypted_url      :string(255)
#  encrypted_notes    :text
#  attachment_uid     :string(255)
#  attachment_name    :string(255)
#  expiration         :datetime
#  project_id         :integer
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_email    :string(255)
#  status_id          :integer          default(1)
#

class Entry < ActiveRecord::Base

  enum status_id: {
    active: 1,
    archived: 2
  }

  # Concerns
  include Guidable

  # Third party
  attr_encrypted :username, key: Rails.application.secrets.entry_username_key
  attr_encrypted :password, key: Rails.application.secrets.entry_password_key
  attr_encrypted :url, key: Rails.application.secrets.entry_url_key
  attr_encrypted :notes, key: Rails.application.secrets.entry_notes_key
  attr_encrypted :email, key: Rails.application.secrets.entry_email_key

  dragonfly_accessor :attachment

  # Relations
  belongs_to :project, counter_cache: true

  # Validations
  validates :title, :project, presence: true

  # Callbacks
  before_validation :set_search_text

  # Delegates
  delegate :name, to: :project, prefix: true

  private
    def set_search_text
      self.search_text = "#{self.project_name} #{self.title}".downcase
    end

  class << self

    def ordered
      order("#{self.table_name}.title")
    end

    def skinny
      select(['id', 'guid', 'title', 'project_id', 'search_text', 'updated_at']\
        .collect {|s| "#{self.table_name}.#{s}"}.join(","))
    end
  end
end
