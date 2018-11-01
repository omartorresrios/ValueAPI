class User < ApplicationRecord
  
  has_many :events, dependent: :destroy

  has_many :send_reviews, class_name: 'Review', foreign_key: 'from', dependent: :nullify
  has_many :received_reviews, class_name: 'Review', foreign_key: 'to', dependent: :nullify

  mount_uploader :avatar, AvatarUploader

end
