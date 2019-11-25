class CreateCustomerDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_details do |t|
      t.references :user, null: false, foreign_key: true
      t.references :shop, null: false, foreign_key: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.decimal :amount_spent, precision: 16, scale: 2, null: false
      t.decimal :previous_point, precision: 16, scale: 2, null: false
      t.decimal :point_balance, precision: 16, scale: 2, null: false

      t.datetime :recorded_on
    end
    add_index :customer_details, :first_name
    add_index :customer_details, :last_name
    add_index :customer_details, :email, unique: true
    add_index :customer_details, :amount_spent
    add_index :customer_details, :previous_point
    add_index :customer_details, :point_balance
    add_index :customer_details, :recorded_on
  end
end
