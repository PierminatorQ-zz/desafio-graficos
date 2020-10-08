class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.string :coffee
      t.integer :price
      t.string :origin
      t.datetime :date_time

      t.timestamps
    end
  end
end
