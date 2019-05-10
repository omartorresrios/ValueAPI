class RemoveReceivedReviewsCountFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :received_reviews_count, :integer
  end
end
