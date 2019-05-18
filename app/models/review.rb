class Review < ApplicationRecord

  belongs_to :sender, class_name: 'User', foreign_key: 'from', counter_cache: :send_reviews_count
  belongs_to :receiver, class_name: 'User', foreign_key: 'to', counter_cache: :received_reviews_count

  belongs_to :company
  #counter_culture :company, column_name: Proc.new {|review| review.sender.send_reviews_count > 0 && review.sender.send_reviews_count < 2 ? 'total_empl_who_recognized_counter' : nil }
  counter_culture :company, column_name: Proc.new {|review| review.sender.send_reviews_count > 0 && review.receiver.received_reviews_count < 2 ? 'total_empl_that_were_recognized_counter' : nil }
  has_many :valueings, dependent: :destroy
  has_many :values, through: :valueings

  validates :body, presence: true
  # validates :value_id, presence: true

  scope :recent, -> { order(created_at: :desc) }
  scope :last_month, lambda { where('DATE(reviews.created_at) > ?', Date.today - 1.month)}

  def self.create_review(user, current, params)
    review = Review.new
    review.from = current.nil? ? nil : current.id
    review.to = user.id
    review.body = params[:body]
    review.company_id = user.company.id
    review.created_at = Time.now
    review.save
    review
  end

end
