require "test_helper"

module Pocket
  class VersionTest < Test::Unit::TestCase
    def test_item_id
      pa = Pocket::Article.new(full_response)
      assert_equal 229279689, pa.item_id
    end

    def full_response
      @full_response ||= File.read("test/fixtures/retreive.json")
    end
  end
end
