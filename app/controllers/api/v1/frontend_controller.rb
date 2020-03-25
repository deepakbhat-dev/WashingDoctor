# frozen_string_literal: true

# Frontend Controller
class Api::V1::FrontendController < Api::V1::BaseController

  def car_size
    sizes = Service.distinct.pluck(:car_size)
    render json: sizes
  end

  def service_type
    types = Service.distinct.pluck(:service_name)
    render json: types
  end

  def price
    price = Service.where(service_name: params[:service_name], car_size: params[:car_size]).select(:id, :price)
    render json: price[0]
  end

  private

  def frontend_params
    params.require(:frontend).permit(:id, :service_name, :car_size, :price, :description)
  end
end
