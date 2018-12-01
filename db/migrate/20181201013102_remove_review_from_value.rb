class RemoveReviewFromValue < ActiveRecord::Migration[5.2]
  def change
    remove_reference :values, :review, foreign_key: true
  end
end
