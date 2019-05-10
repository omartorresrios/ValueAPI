class AddSendReviewsCount < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :send_reviews_count, :integer, :default => 0

    User.reset_column_information
    User.all.each do |user|
      User.update_counters user.id, :send_reviews_count => user.send_reviews.length
    end
  end
end
