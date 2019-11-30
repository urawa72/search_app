if Rails.env.development?
  config = {
    host: "http://es:9200",
  }
  Elasticsearch::Model.client = Elasticsearch::Client.new(config)
end
