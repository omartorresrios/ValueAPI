class AddCompanyToDepartments < ActiveRecord::Migration[5.2]
  def change
    add_reference :departments, :company, foreign_key: true
  end
end
