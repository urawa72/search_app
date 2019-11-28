class Book < ApplicationRecord
  include Searchable

  def self.isbn_13_to_10(isbn_13)
    tmp = (isbn_13).gsub("-", "").slice(3..11)
    sum = 0
    10.downto(2).each_with_index do |num, index|
      sum += tmp[index].to_i * num
    end
    mod = 11 - sum % 11
    case mod
    when 11
      tmp + "0"
    when 10
      tmp + "X"
    else
      tmp + mod.to_s
    end
  end

  def as_indexed_json(options={})
    {
      id: id,
      title: title,
      url: url,
      price: price,
      published_at: published_at,
      isbn_10: isbn_10,
      content: content
    }
  end
end
