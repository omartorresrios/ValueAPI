class DeleteValueColumnFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :value, :string
  end
end
