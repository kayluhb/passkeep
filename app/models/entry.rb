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
#

class Entry < ActiveRecord::Base
  belongs_to :project
end
