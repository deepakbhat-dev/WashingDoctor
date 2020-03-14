# frozen_string_literal: true

class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.belongs_to :customer, index: true, null: false
      t.belongs_to :car, index: true, null: false
      t.belongs_to :service, index: true, null: false
      t.string :feedback, null: false

      t.timestamps
    end
  end
end
