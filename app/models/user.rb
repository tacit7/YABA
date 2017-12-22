class User < ApplicationRecord
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # downcase email before saving
  before_save { self.email = email.downcase }
  has_secure_password

  scope :admin,     ->() { where( admin: true ) }
  scope :not_admin, ->() { where( admin: false ) }

  has_many :articles, dependent: :destroy

  validates :username,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 25 }

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: 105 },
            format: { with: EMAIL_REGEX }
end
