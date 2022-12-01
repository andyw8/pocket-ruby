# typed: true
module Pocket
  class Author
    def initialize(response)
      @response = response
    end

    def id
      Integer(response.fetch("author_id"))
    end

    def name
      response.fetch("name")
    end

    def url
      response.fetch("url")
    end

    private

    attr_reader :response
  end
end
