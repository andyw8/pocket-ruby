require "json"

module Pocket
  class Article
    attr_reader :response

    def initialize(response)
      @response = response
    end

    def item_id
      Integer(parsed_response.fetch("item_id"))
    end

    def given_url
      parsed_response.fetch("given_url")
    end

    def resolved_url
      parsed_response.fetch("resolved_url")
    end

    def given_title
      parsed_response.fetch("given_title")
    end

    def resolved_title
      parsed_response.fetch("resolved_title")
    end

    def favorite?
      Integer(parsed_response.fetch("favorite")) == 1
    end

    def status
      Integer(parsed_response.fetch("status"))
    end

    def excerpt
      parsed_response.fetch("excerpt")
    end

    def article?
      Integer(parsed_response.fetch("is_article")) == 1
    end

    def has_image?
      Integer(parsed_response.fetch("has_image")) == 1
    end

    def image?
      Integer(parsed_response.fetch("has_image")) == 2
    end

    def has_video?
      Integer(parsed_response.fetch("has_video")) == 1
    end

    def video?
      Integer(parsed_response.fetch("has_video")) == 2
    end

    def word_count
      Integer(parsed_response.fetch("word_count"))
    end

    def resolved_id
      Integer(parsed_response.fetch("resolved_id"))
    end

    def thumbnail
      parsed_response.fetch("top_image_url", "")
    end

    def time_added
      return nil unless parsed_response["time_added"]
      Time.at(Integer(parsed_response["time_added"]))
    end

    def time_updated
      return nil unless parsed_response["time_updated"]
      Time.at(Integer(parsed_response["time_updated"]))
    end

    def time_read
      return nil unless parsed_response["time_read"]
      Time.at(Integer(parsed_response["time_read"]))
    end

    def favorited?
      Integer(parsed_response["time_favorited"]) > 0
    end

    def time_favorited
      return nil unless parsed_response["time_favorited"]
      Time.at(Integer(parsed_response["time_favorited"]))
    end

    def read?
      Integer(parsed_response["time_read"]) > 0
    end

    def read_url
      "https://getpocket.com/read/#{item_id}"
    end

    private

    def parsed_response
      @parsed_response ||= JSON.parse(response)
    end
  end
end
