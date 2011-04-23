# == Schema Information
# Schema version: 20110423180025
#
# Table name: entry_tags
#
#  id         :integer(4)      not null, primary key
#  entry_id   :integer(4)
#  tag_id     :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class EntryTag < ActiveRecord::Base
  belongs_to :entry
  belongs_to :tag
end
