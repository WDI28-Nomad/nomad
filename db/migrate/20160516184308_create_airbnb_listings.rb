class CreateAirbnbListings < ActiveRecord::Migration
  def change
    create_table :airbnb_listings do |t|

      t.timestamps null: false
    end
  end
end
