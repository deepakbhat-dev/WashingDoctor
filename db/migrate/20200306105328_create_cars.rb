# frozen_string_literal: true

class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :car_name, null: false
      t.string :registration_number, null: false, limit: 10
      t.string :size, null: false, limit: 10
      t.integer :wash_number, null: false

      t.timestamps
    end
    add_index :cars, :registration_number, unique: true
  end
end
