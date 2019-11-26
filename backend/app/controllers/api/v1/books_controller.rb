class Api::V1::BooksController < ApplicationController
  def full_search
    results = Book.search(params[:keyword]).results.to_a.map do |result|
      {
        source: {
          title: result['_source'][:title],
          url: result['_source'][:url],
          price: result['_source'][:price],
          published_at: result['_source'][:published_at]
        },
        highlight: {
          title: result[:highlight][:title]&.first,
          content: result[:highlight][:content]&.first
        }
      }
    end
    render json: results
  end
end
