# frozen_string_literal: true

class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :full_name, null: false
      t.string :phone_number, null: false, limit: 10
      t.integer :wash_number, null: false

      t.timestamps
    end
    add_index :customers, :phone_number, unique: true
  end
end
