class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.integer :number
      t.string :date
      t.string :departure_city
      t.string :arrival_city
      t.references :airline, foreign_key: true
    end
  end
end
