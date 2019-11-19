class Api::V1::BooksController < ApplicationController
  def full_search
    render json: Book.search(params[:keyword]).results.to_a
  end
end
