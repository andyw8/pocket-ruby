require "test_helper"

module Pocket
  class VersionTest < Test::Unit::TestCase
    test "from_json" do
      json_string = File.read("test/fixtures/retreive.json")
      article = Pocket::Article.from_json(json_string)
      assert_equal 229279689, article.item_id
    end

    test "item_id" do
      assert_equal 229279689, article.item_id
    end

    test "given_url" do
      assert_equal "http://www.grantland.com/blog/the-triangle/post/_/id/38347/ryder-cup-preview?given", article.given_url
    end

    test "resolved_url" do
      assert_equal "http://www.grantland.com/blog/the-triangle/post/_/id/38347/ryder-cup-preview?resolved", article.resolved_url
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

    test "status" do
      assert_equal 0, article.status
    end

    test "excerpt" do
      assert_include article.excerpt, "list of things"
    end

    test "article?" do
      assert article.article?
    end

    test "has_image?" do
      assert article.has_image?
    end

    test "image?" do
      refute article.image?
    end

    test "has_video?" do
      assert article.has_video?
    end

    test "video?" do
      refute article.video?
    end

    test "word_count" do
      assert_equal 3197, article.word_count
    end

    test "resolved_id" do
      assert_equal 229279689, article.resolved_id
    end

    test "thumbnail" do
      assert_equal "https://example.com/image.png", article.thumbnail
    end

    test "time_added" do
      assert_equal Time.utc(2021, 4, 3, 1, 23, 12), article.time_added
    end

    test "time_added is nil if field not present" do
      parsed_response.delete("time_added")
      assert_nil article.time_added
    end

    test "time_updated" do
      assert_equal Time.utc(2021, 4, 3, 1, 23, 13), article.time_updated
    end

    test "time_updated is nil if field not present" do
      parsed_response.delete("time_updated")
      assert_nil article.time_updated
    end

    test "time_read" do
      assert_equal Time.utc(2021, 4, 3, 1, 23, 14), article.time_read
    end

    test "time_read is nil if field is not present" do
      parsed_response.delete("time_read")
      assert_nil article.time_read
    end

    test "favorited?" do
      assert article.favorited?
    end

    test "time_favorited" do
      assert_equal Time.utc(2021, 4, 3, 1, 23, 15), article.time_favorited
    end

    test "time_favorited is nil if field not present" do
      parsed_response.delete("time_favorited")
      assert_nil article.time_favorited
    end

    test "read?" do
      assert article.read?
    end

    test "read_url" do
      assert_equal "https://getpocket.com/read/229279689", article.read_url
    end

    test "tags" do
      assert_equal ["my-tag-1", "my-tag-2"], article.tags
    end

    test "tags returns an empty array if there are no tags" do
      parsed_response.delete("tags")
      assert_equal [], article.tags
    end

    test "authors" do
      result = article.authors
      assert_equal 1, result.size
      assert_equal "Stephen King", result.first.name
      assert_equal 62344201, result.first.id
      assert_equal "https://example.com/author", result.first.url
    end

    test "authors returns an empty array if there are no tags" do
      parsed_response.delete("authors")
      assert_equal [], article.authors
    end

    private

    def article
      @article ||= Pocket::Article.new(parsed_response)
    end

    def parsed_response
      @parsed_response ||= JSON.parse(File.read("test/fixtures/retreive.json"))
    end
  end
end
