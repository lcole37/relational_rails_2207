class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.integer :number
      t.string :airline
      t.string :destination
      t.boolean :international

      t.timestamps
    end
  end
end
