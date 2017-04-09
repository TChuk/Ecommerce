class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :postal_code
      t.string :email
      t.references :user, foreign_key: true
      t.references :province, foreign_key: true

      t.timestamps
    end
  end
end
