require "test_helper"

module Pocket
  class VersionTest < Test::Unit::TestCase
    test "item_id" do
      assert_equal 229279689, article.item_id
    end

    test "given_url" do
      assert_equal "http://www.grantland.com/blog/the-triangle/post/_/id/38347/ryder-cup-preview?a=b", article.given_url
    end

    test "resolved_url" do
      assert_equal "http://www.grantland.com/blog/the-triangle/post/_/id/38347/ryder-cup-preview", article.resolved_url
    end

    test "given_title" do
      assert_equal "The Massive Ryder Cup Preview - The Triangle Blog - Grantland", article.given_title
    end

    test "resolved_title" do
      assert_equal "The Massive Ryder Cup Preview", article.resolved_title
    end

    test "favorite? is false is field is '0'" do
      assert_equal false, article.favorite?
    end

    private

    def article
      @article ||= Pocket::Article.new(full_response)
    end

    def full_response
      @full_response ||= File.read("test/fixtures/retreive.json")
    end
  end
end
