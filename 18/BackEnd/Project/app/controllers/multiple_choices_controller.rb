class MultipleChoicesController < ApplicationController
  def index
    @multiple_choices = MultipleChoice.ransack(params[:q]).result.sample(params[:number])
    render json: {
      success: true,
      data: ActiveModel::SerializableResource.new(@multiple_choices)
    }
  end

  def answer
    @result = true if params[:content] == MultipleChoice.find(params[:id]).right_answer
    render json: {
      success: true,
      data: @result || false
    }
  end
end
      