class RemoveTotalSendReviewsCountFromCompanies < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :total_send_reviews_count, :integer
  end
end
