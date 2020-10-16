class UnitsController < ApplicationController
  def index
    @units = Unit.where(book_id: params[:book_id])
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
  