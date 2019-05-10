class RemoveTotalReceivedReviewsCountFromCompanies < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :total_received_reviews_count, :integer
  end
end
