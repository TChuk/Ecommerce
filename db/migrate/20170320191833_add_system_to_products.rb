class AddSystemToProducts < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :system, foreign_key: true
  end
end
