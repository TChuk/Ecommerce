class AddTotalPriceToLineItem < ActiveRecord::Migration[5.0]
  def change
    add_column :line_items, :total_price, :decimal
  end
end
