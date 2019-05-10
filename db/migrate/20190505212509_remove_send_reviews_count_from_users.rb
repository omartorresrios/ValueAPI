class RemoveSendReviewsCountFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :send_reviews_count, :integer
  end
end
