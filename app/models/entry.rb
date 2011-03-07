# == Schema Information
# Schema version: 20110226214519
#
# Table name: entries
#
#  id                      :integer(4)      not null, primary key
#  title                   :string(255)
#  encrypted_username      :string(255)
#  encrypted_password      :string(255)
#  encrypted_url           :string(255)
#  encrypted_notes         :text
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
  attr_accessible :title, :encrypted_username, :username, :password, :url,
                  :notes, :expiration, :attachment
  attr_encrypted :username, :password, :url, :notes, 
                 :key => '&@it)a|S_eouL-hnBq^BJ_!]&A+3pTaw9|N;,kYMD(s.*/UmQD8F|-`HC<#<Qm'

  acts_as_taggable_on :tags

  has_attached_file :attachment,
    :url => "/system/attachments/:id_:basename.:extension",
    :path => ":rails_root/public/attachments/:id_:basename.:extension"

  validates :title, :presence => true
end
