module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model

    index_name { name.underscore.pluralize }

    settings index: {
      number_of_shards: 1,
      number_of_replicas: 0,
      analysis: {
        filter: {
          greek_lowercase_filter: {
            type: 'lowercase',
            language: 'greek'
          },
          katakana_stemmer: {
            type: 'kuromoji_stemmer',
            minimum_length: 4
          }
        },
        tokenizer: {
          kuromoji: {
            type: 'kuromoji_tokenizer'
          }
        },
        analyzer: {
          kuromoji_analyzer: {
            type: 'custom',
            char_filter: [
              'html_strip',
              'kuromoji_iteration_mark'
            ],
            tokenizer: 'kuromoji_tokenizer',
            filter: [
              'kuromoji_baseform',
              'greek_lowercase_filter',
              'kuromoji_part_of_speech',
              'ja_stop',
              'cjk_width',
              'kuromoji_number',
              'katakana_stemmer'
            ],
          }
        }
      }
    }

    mapping dynamic: 'false' do
      indexes :id, type: 'long'
      indexes :title, type: 'text', analyzer: 'kuromoji_analyzer'
      indexes :url, index: false
      indexes :price, index: false
      indexes :published_at, index: false
      indexes :content, type: 'text', analyzer: 'kuromoji_analyzer'
    end
  end

  class_methods do
    def create_index!
      client = __elasticsearch__.client
      client.indices.delete index: self.index_name rescue nil
      client.indices.create(index: self.index_name,
                            body: { settings: self.settings.to_hash, mappings: self.mappings.to_hash })
    end

    def import_record
      __elasticsearch__.import
    end

    def search(keyword)
      query = {
        query: {
          bool: {
            should: [
              { match: { title: { query: keyword, operator: "and" } } },
              { match: { content: { query: keyword, operator: "and" } } }
            ]
          }
        },
        sort: [
          { "id": { order: "desc" } }
        ],
        highlight: {
          pre_tags: ['<highlight>'],
          post_tags: ['</highlight>'],
          number_of_fragments: 100,
          fields: {
            "title": {},
            "content": {}
          }
        },
        size: 100
      }
      __elasticsearch__.search(query)
    end
  end
end
