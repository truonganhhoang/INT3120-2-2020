class QuestionsController < ApplicationController
  def index
    @quests = Question.ransack(params[:q]).result.sample(params[:number])
    render json: {
      success: true,
      data: ActiveModel::SerializableResource.new(@quests)
    }
  end

  def answer
    @result = true if params[:content] == Question.find(params[:id]).answer
    render json: {
      success: true,
      data: @result || false
    }
  end
end
    