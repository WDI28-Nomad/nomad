class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :name
      t.string :expense_type
      t.float :amount
      t.date :start_date
      t.date :end_date
      t.string :notes

      t.timestamps null: false
    end
  end
end
