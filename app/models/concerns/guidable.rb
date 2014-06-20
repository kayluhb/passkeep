module Guidable
  extend ActiveSupport::Concern

  included do

    before_validation :make_guid

    validates :guid, presence: true

    def to_param
      self.guid
    end

    private
      def make_guid
        self.guid = UUIDTools::UUID.random_create.to_s if guid.blank?
      end
  end

  module ClassMethods

    def from_param(param)
      self.find_by_guid!(param)
    end

  end

end
