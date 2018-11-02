class User < ApplicationRecord
  has_secure_password validations: false

  has_many :send_reviews, class_name: 'Review', foreign_key: 'from', dependent: :nullify
  has_many :received_reviews, class_name: 'Review', foreign_key: 'to', dependent: :nullify

  mount_uploader :avatar, AvatarUploader

  EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  FULLNAME_REGEX = /\A[a-zA-Z0-9_-]{3,30}\z/

  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }, unless: :google_login?
  validates :fullname, presence: true, unless: :google_login?
  # validates :id, presence: true, unless: :google_login?

  def self.authenticate(email_or_fullname, password)
    user = User.find_by(email: email_or_fullname)
    user && user.authenticate(password)
  end

  def self.authenticate_google(google_id)
    user = User.find_by(google_id: google_id)
    user && user.authenticate(google_id)
  end

  def google_login?
    google_id.present?
  end

  def avatar_url
    avatar.url
  end

end
