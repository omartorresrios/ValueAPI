class Review < ApplicationRecord

  belongs_to :sender, class_name: 'User', foreign_key: 'from'
  belongs_to :receiver, class_name: 'User', foreign_key: 'to'

  validates :body, presence: true

  scope :recent, -> { order(created_at: :desc) }

  
  def self.create_review(user, current, params)
    review = Review.new
    review.from = current.nil? ? nil : current.id
    review.to = user.id
    review.body = params[:body]
    review.created_at = Time.now
    review.save
    review
  end

end
