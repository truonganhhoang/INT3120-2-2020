class BooksController < ApplicationController
  def index
    @books = Book.all
    render json: {
      success: true,
      data: ActiveModel::SerializableResource.new(@books)
    }
  end

  def show
    @book = Book.find(params[:id])
    render json: {
      success: true,
      data: ActiveModel::SerializableResource.new(@book)
    }
  end
end
