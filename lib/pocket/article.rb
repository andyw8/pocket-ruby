require "json"

module Pocket
  class Article
    attr_reader :response

    def initialize(response)
      @response = response
    end

    def self.from_json(json_string)
      new(JSON.parse(json_string))
    end

    def item_id
      Integer(response.fetch("item_id"))
    end

    def given_url
      response.fetch("given_url")
    end

    def resolved_url
      response.fetch("resolved_url", nil)
    end

    def given_title
      response.fetch("given_title")
    end

    def resolved_title
      response.fetch("resolved_title", nil)
    end

    def favorite?
      Integer(response.fetch("favorite")) == 1
    end

    def status
      Integer(response.fetch("status"))
    end

    def excerpt
      return nil unless response["excerpt"]
      response.fetch("excerpt")
    end

    def article?
      return false unless response["is_article"]
      Integer(response.fetch("is_article")) == 1
    end

    def has_image?
      Integer(response.fetch("has_image")) == 1
    end

    def image?
      Integer(response.fetch("has_image")) == 2
    end

    def has_video?
      Integer(response.fetch("has_video")) == 1
    end

    def video?
      Integer(response.fetch("has_video")) == 2
    end

    def word_count
      return nil unless response["word_count"]
      Integer(response.fetch("word_count"))
    end

    def resolved_id
      Integer(response.fetch("resolved_id"))
    end

    def thumbnail
      response.fetch("top_image_url", "")
    end

    def time_added
      return nil unless response["time_added"]
      Time.at(Integer(response["time_added"])).utc
    end

    def time_updated
      return nil unless response["time_updated"]
      Time.at(Integer(response["time_updated"])).utc
    end

    def time_read
      return nil unless response["time_read"]
      return nil if response["time_read"] == "0"
      Time.at(Integer(response["time_read"])).utc
    end

    def favorited?
      Integer(response["time_favorited"]) > 0
    end

    def time_favorited
      return nil unless response["time_favorited"]
      return nil if response["time_favorited"] == "0"
      Time.at(Integer(response["time_favorited"])).utc
    end

    def read?
      Integer(response["time_read"]) > 0
    end

    def read_url
      "https://getpocket.com/read/#{item_id}"
    end

    def tags
      Hash(response["tags"]).values.map { |tag| tag["tag"] }
    end

    def authors
      Hash(response["authors"]).values.map { |value| Pocket::Author.new(value) }
    end

    def domain_metadata
      return nil unless response["domain_metadata"]
      Pocket::DomainMetadata.new(response["domain_metadata"])
    end

    def time_to_read
      return nil unless response["time_to_read"]
      return nil if response["time_to_read"] == 0
      response.fetch("time_to_read")
    end

    def time_to_read_category
      return nil if time_to_read.nil?

      if time_to_read >= 21
        "very_long"
      elsif time_to_read >= 11
        "long"
      elsif time_to_read >= 6
        "medium"
      else
        "quick"
      end
    end
  end
end
