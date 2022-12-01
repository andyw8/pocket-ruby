# typed: false
module Pocket
  class DomainMetadata
    def initialize(response)
      @response = response
    end

    def name
      response.fetch("name")
    end

    def logo
      response.fetch("logo")
    end

    def greyscale_logo
      response.fetch("greyscale_logo")
    end

    private

    attr_reader :response
  end
end
