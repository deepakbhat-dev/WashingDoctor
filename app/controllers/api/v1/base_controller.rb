# frozen_string_literal: true

# Base Controller for APIs
class Api::V1::BaseController < ApplicationController
  respond_to :json
end
