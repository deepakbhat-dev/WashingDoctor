# frozen_string_literal: true

class Job < ApplicationRecord
  belongs_to :customer
  belongs_to :car
  belongs_to :service
  validates :feedback, presence: true
end
