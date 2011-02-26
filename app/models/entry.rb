# == Schema Information
# Schema version: 20110226214519
#
# Table name: entries
#
#  id                      :integer(4)      not null, primary key
#  title                   :string(255)
#  username                :string(255)
#  password                :string(255)
#  url                     :string(255)
#  notes                   :text
#  expiration              :datetime
#  attachment_file_name    :string(255)
#  attachment_content_type :string(255)
#  attachment_file_size    :string(255)
#  attachment_updated_at   :datetime
#  created_at              :datetime
#  updated_at              :datetime
#

class Entry < ActiveRecord::Base

  # Setup accessible (or protected) attributes for your model
  attr_accessible :title, :username, :password, :url, :notes, :expiration, :attachment
  attr_encrypted_options.merge!(:prefix => '', :suffix => '_crypted')
  attr_encrypted :username, :key => Settings.entry.username, :encode => true
  attr_encrypted :password, :key => Settings.entry.password, :encode => true
  attr_encrypted :url, :key => Settings.entry.url, :encode => true
  attr_encrypted :notes, :key => Settings.entry.notes, :encode => true

  acts_as_taggable_on :tags

  has_attached_file :attachment,
    :url => "/system/attachments/:id_:basename.:extension",
    :path => ":rails_root/public/attachments/:id_:basename.:extension"

  validates :title, :presence => true

end
