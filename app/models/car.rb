# frozen_string_literal: true

class Car < ApplicationRecord
  belongs_to :customer
  has_many :services, through: :jobs
  has_many :jobs, dependent: :destroy
  validates :car_name, :registration_number, :size, :wash_number, presence: true
  validates :registration_number, :size, length: { maximum: 10 }
end
