class CreateRentalposts < ActiveRecord::Migration
  def change
    create_table :rentalposts do |t|
      t.string :rentaltype
      t.integer :user_id
      t.string :rental_desc
      t.integer :price
      t.string :status
      t.string :addrl1
      t.string :addrl2
      t.string :city
      t.string :state
      t.string :country
      t.string :contactpref

      t.timestamps
    end
    add_index :rentalposts, [:user_id, :created_at]
  end
end
