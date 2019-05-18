class DeleteValueIdFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :value_id, :integer
  end
end
