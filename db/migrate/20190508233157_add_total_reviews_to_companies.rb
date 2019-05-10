class AddTotalReviewsToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :total_reviews_count, :integer, :default => 0
  end
end
