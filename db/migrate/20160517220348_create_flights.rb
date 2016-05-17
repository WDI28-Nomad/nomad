class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
