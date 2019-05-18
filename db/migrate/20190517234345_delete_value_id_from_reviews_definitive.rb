class DeleteValueIdFromReviewsDefinitive < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :value_id, :bigint
  end
end
