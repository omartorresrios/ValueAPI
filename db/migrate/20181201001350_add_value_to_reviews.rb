class AddValueToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :value, :string
  end
end
