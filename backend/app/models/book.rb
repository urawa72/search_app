class Book < ApplicationRecord
  include Searchable

  def as_indexed_json(options={})
    {
      id: id,
      title: title,
      url: url,
      published_at: published_at,
      content: content
    }
  end
end
