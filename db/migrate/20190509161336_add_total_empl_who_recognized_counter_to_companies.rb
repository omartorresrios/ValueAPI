class AddTotalEmplWhoRecognizedCounterToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :total_empl_who_recognized_counter, :integer, null: false, default: 0
  end
end
