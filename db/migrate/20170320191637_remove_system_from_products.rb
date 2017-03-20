class RemoveSystemFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :system, :string
  end
end
