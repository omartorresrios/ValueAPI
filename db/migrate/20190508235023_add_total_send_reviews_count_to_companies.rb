class AddTotalSendReviewsCountToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :total_send_reviews_count, :integer, :default => 0
  end
end
