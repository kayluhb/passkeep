# == Schema Information
# Schema version: 20110225140019
#
# Table name: entries
#
#  id                      :integer(4)      not null, primary key
#  title                   :string(255)
#  username                :string(255)
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
  attr_accessible :title, :username, :url, :notes, :expiration, :attachment

  has_attached_file :attachment,
    :url => "/system/attachments/:id_:basename.:extension",
    :path => ":rails_root/public/attachments/:id_:basename.:extension"

  validates :title, :presence => true

end
