class User < ApplicationRecord
  
  has_many :events, dependent: :destroy

  has_many :send_reviews, class_name: 'Review', foreign_key: 'from', dependent: :nullify
  has_many :received_reviews, class_name: 'Review', foreign_key: 'to', dependent: :nullify

  mount_uploader :avatar, AvatarUploader


  def self.authenticate(email_or_fullname, password)
    user = User.find_by(email: email_or_fullname)
    user && user.authenticate(password)
  end

  def self.authenticate_google(google_id)
    user = User.find_by(google_id: google_id)
    user && user.authenticate(google_id)
  end

  def avatar_url
    if facebook_login? && avatar.url.nil?
      "https://graph.facebook.com/#{facebook_id}/picture?type=large"
    else
      avatar.url
    end
  end

end
