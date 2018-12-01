class AddNameToDepartment < ActiveRecord::Migration[5.2]
  def change
    add_column :departments, :name, :string
  end
end
