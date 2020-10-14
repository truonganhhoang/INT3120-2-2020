class UnitsController < ApplicationController
  def index
    @units = Unit.all
    render json: {
      success: true,
      data: ActiveModel::SerializableResource.new(@units)
    }
  end

  def show
    @unit = Unit.find(params[:id])
    render json: {
      success: true,
      data: ActiveModel::SerializableResource.new(@unit)
    }
  end
end
  