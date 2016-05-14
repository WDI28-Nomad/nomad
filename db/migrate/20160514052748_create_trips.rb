class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.string :trip_type
      t.integer :budget
      t.string :origin
      t.string :destination
      t.string :description
      t.date :departure_date
      t.date :return_date

      t.timestamps null: false
    end
  end
end
