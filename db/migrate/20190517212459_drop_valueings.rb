class DropValueings < ActiveRecord::Migration[5.2]
  def change
    drop_table :valueings
  end
end
