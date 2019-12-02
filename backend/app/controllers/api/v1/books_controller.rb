class Api::V1::BooksController < ApplicationController
  def index
    results = Book.all
    render json: results
  end

  def full_search
    results = Book.search(params[:keyword]).results.to_a.map do |result|
      {
        source: {
          title: result['_source'][:title],
          url: result['_source'][:url],
          price: result['_source'][:price],
          published_at: result['_source'][:published_at],
          isbn_10: result['_source'][:isbn_10]
        },
        highlight: {
          title: result[:highlight][:title]&.first,
          content: result[:highlight][:content]
        }
      }
    end
    render json: results
  end
end
