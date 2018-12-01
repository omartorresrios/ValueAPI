class AddNameToValue < ActiveRecord::Migration[5.2]
  def change
    add_column :values, :name, :string
  end
end
