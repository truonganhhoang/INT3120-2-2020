class NewWordsController < ApplicationController
  def index
    @words = NewWord.where(unit_id: params[:unit_id]).result
    @words = @words.page(params[:track]).per(6)
    render json: {
      success: true,
      data: ActiveModel::SerializableResource.new(@words),
      total_tracks: @words.total_pages,
      current_track: @words.current_page
    }
  end

  def show
    @word = NewWord.find(params[:id])
    render json: {
      success: true,
      data: ActiveModel::SerializableResource.new(@word)
    }
  end
end
