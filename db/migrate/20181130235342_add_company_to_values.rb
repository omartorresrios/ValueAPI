class AddCompanyToValues < ActiveRecord::Migration[5.2]
  def change
    add_reference :values, :company, foreign_key: true
  end
end
