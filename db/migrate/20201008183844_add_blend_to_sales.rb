class AddBlendToSales < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :blend, :string
  end
end
