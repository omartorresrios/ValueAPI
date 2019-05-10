class RemoveReviewsCountFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :reviews_count, :integer
  end
end
