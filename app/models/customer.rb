# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :cars, dependent: :destroy
  has_many :jobs, dependent: :destroy
  has_many :services, through: :jobs
  validates :full_name, :phone_number, :wash_number, presence: true
  validates :phone_number, length: { is: 10 }
end
