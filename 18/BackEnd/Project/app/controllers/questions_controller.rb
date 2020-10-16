class QuestionsController < ApplicationController
  def index
    @quests = Question.ransack(params[:q]).result.sample(params[:number].to_i)
    render json: {
      success: true,
      data: ActiveModel::SerializableResource.new(@quests)
    }
  end

  def answer
    @question = Question.find(params[:id])
    result = true if params[:answer] == @question.answer
    render json: {
      success: true,
      data: { right_answer: @question.answer, result: result || false }
    }
  end
end
