class AddValueings < ActiveRecord::Migration[5.2]
  def change
    create_table :valueings do |t|
      t.references :review, foreign_key: true
      t.references :value, foreign_key: true

      t.timestamps
    end
  end
end
