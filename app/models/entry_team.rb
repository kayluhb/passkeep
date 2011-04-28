class EntryTeam < ActiveRecord::Base
  belongs_to :entry
  belongs_to :team
end
