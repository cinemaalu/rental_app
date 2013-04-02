class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :mi_name
      t.string :last_name
      t.string :email
      t.integer:phone1
      t.integer:phone2
      t.integer:phone3
      t.string :addr1
      t.string :addr2
      t.string :city
      t.string :state
      t.string :country
      t.string :uri

      t.timestamps
    end
  end
end
