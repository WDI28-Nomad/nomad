class CreateAirbnbRentals < ActiveRecord::Migration
  def change
    create_table :airbnb_rentals do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
