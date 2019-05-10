class AddReceivedReviewsCountToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :received_reviews_count, :integer
  end
end
