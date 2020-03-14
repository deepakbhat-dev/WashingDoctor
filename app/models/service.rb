# frozen_string_literal: true

class Service < ApplicationRecord
  has_many :jobs
  has_many :customers, through: :jobs
  has_many :cars, through: :jobs
  validates :service_name, presence: true, length: { maximum: 20 }
  validates :car_size, presence: true, length: { maximum: 10 }
  validates :price, :description, presence: true
end
