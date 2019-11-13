class CreateEarningRules < ActiveRecord::Migration[6.0]
  def change
    create_table :earning_rules do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :point, null: false
      t.boolean :status, null: false

      t.timestamps
    end
    add_index :earning_rules, :name
    add_index :earning_rules, :point
    add_index :earning_rules, :status
  end
end
