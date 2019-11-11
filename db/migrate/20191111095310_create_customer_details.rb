class CreateCustomerDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_details do |t|
      t.references :earning_rule, null: false, foreign_key: true
      t.string :name, null: false
      t.string :email, null: false
      t.decimal :point_balance, precision: 8, scale: 2, null: false
      t.string :event

      t.timestamps
    end
    add_index :customer_details, :name
    add_index :customer_details, :email, unique: true
    add_index :customer_details, :point_balance
  end
end
