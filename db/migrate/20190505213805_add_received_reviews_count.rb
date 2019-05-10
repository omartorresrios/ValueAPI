class AddReceivedReviewsCount < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :received_reviews_count, :integer, :default => 0

    User.reset_column_information
    User.all.each do |user|
      User.update_counters user.id, :received_reviews_count => user.received_reviews.length
    end
  end
end
