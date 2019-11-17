require 'nokogiri'
require 'open-uri'

namespace :scraping do
  desc "オライリー書籍情報スクレイピング"
  task oreilly: :environment do
    puts "start scraping oreilly"

    # oreillyベースURL
    base_url = "https://www.oreilly.co.jp"

    # 書籍一覧
    url = "#{base_url}/catalog/"
    html, charset = open(url) do |f|
      [f.read, f.charset]
    end

    # 書籍名と書籍詳細URL
    doc = Nokogiri::HTML.parse(html, nil, charset)
    books = doc.css("table#bookTable tbody tr").each_with_object([]) do |node, arr|
      title_node = node.css("td.title a")
      arr << {
        title: title_node.text,
        url: base_url + title_node.attribute("href").to_s.gsub("..", ""),
        price: node.css("td.price").text,
        published_at: node.xpath("td[4]").text
      }
    end

    # 各書籍の目次取得
    books_arr = books.each_with_object([]) do |book, arr|
      book_url = book[:url]
      puts "scrape #{book[:title]}"
      next unless book_url
      html, charset = open(book_url) do |f|
        [f.read, f.charset]
      end
      doc = Nokogiri::HTML.parse(html, nil, charset)
      doc.css("#toc pre").each do |node|
        book[:content] = node.content
        arr << Book.new(book)
      end
      sleep(1)
    end

    # bulk insert
    Book.import books_arr

    puts "end scraping oreilly"
  end
end
