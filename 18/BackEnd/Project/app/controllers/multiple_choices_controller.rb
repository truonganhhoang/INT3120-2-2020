class MultipleChoicesController < ApplicationController
  def index
    @multiple_choices = MultipleChoice.ransack(params[:q]).result.sample(params[:number])
    render json: {
      success: true,
      data: ActiveModel::SerializableResource.new(@multiple_choices)
    }
  end

  def answer
    @multiple_choice = MultipleChoice.find(params[:id])
    result = true if params[:answer] == @multiple_choice.right_answer
    render json: {
      success: true,
      data: { answer: @multiple_choice.right_answer, result: result || false }
    }
  end
end
