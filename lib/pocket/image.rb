# typed: true
module Pocket
  class Image
    attr_reader :response

    def initialize(response)
      @response = response
    end

    def src
      response.fetch("src")
    end

    def caption
      response.fetch("caption")
    end

    def image_id
      Integer(response.fetch("image_id"))
    end
  end
end
