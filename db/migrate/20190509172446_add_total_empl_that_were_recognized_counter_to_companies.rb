class AddTotalEmplThatWereRecognizedCounterToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :total_empl_that_were_recognized_counter, :integer, null: false, default: 0
  end
end
