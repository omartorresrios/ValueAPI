class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :from
      t.string :to
      t.string :body

      t.timestamps
    end
  end
end
