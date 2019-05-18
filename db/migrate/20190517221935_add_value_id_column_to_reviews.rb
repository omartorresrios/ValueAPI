class AddValueIdColumnToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :value_id, :integer
  end
end
