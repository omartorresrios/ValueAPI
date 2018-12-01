class AddReviewToValues < ActiveRecord::Migration[5.2]
  def change
    add_reference :values, :review, foreign_key: true
  end
end
