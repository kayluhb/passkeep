class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :registerable, :confirmable, :token_authenticatable, :timeoutable and :omniauthable
  devise :database_authenticatable, :lockable, :encryptable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name, :full_name, :time_zone

  attr_accessor :full_name

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  before_validation :make_guid

  def full_name
    "#{first_name} #{last_name}".strip
  end

  def full_name=(n)
    split = n.split(' ', 2)
    self.first_name = split.first
    self.last_name = split.last
  end

  def to_param
    self.guid
  end

  private
    def make_guid
      self.guid = UUIDTools::UUID.random_create.to_s if guid.blank?
    end

  protected
    def password_required?
      !persisted? || password.present? || password_confirmation.present?
    end

  class << self
    def ordered
      order("users.last_name, users.first_name")
    end

    def skinny
      select("users.id, guid, email, first_name, last_name")
    end
  end
end
