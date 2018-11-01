class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :email
      t.string :google_id

      t.timestamps
    end
    add_index :users, :google_id
  end
end
