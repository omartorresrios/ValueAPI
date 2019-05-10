class AddTotalReceivedReviewsCountToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :total_received_reviews_count, :integer, :default => 0
  end
end
