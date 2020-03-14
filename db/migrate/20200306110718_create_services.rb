# frozen_string_literal: true

class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :service_name, null: false, limit: 20
      t.string :car_size, null: false, limit: 10
      t.integer :price, null: false
      t.string :description, null: false

      t.timestamps
    end
    add_index :services, %i[service_name car_size], unique: true
  end
end
