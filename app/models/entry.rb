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
  attr_encrypted :username, :key => 'a secret key'
  attr_encrypted :password, :key => 'a secret key'
  attr_encrypted :url, :key => 'a secret key'
  attr_encrypted :notes, :key => 'a secret key'

  acts_as_taggable_on :tags

  has_attached_file :attachment,
    :url => "/system/attachments/:id_:basename.:extension",
    :path => ":rails_root/public/attachments/:id_:basename.:extension"

  validates :title, :presence => true

end
