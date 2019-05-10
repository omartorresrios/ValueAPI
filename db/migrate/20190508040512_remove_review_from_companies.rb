class RemoveReviewFromCompanies < ActiveRecord::Migration[5.2]
  def change
    remove_reference :companies, :review, foreign_key: true
  end
end
