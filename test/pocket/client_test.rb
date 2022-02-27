require "test_helper"
require "webmock/minitest"

class ClientTest < ActiveSupport::TestCase
  test "retrieve" do
    stub_request(:post, "https://getpocket.com/v3/get")
      .with(
        body: "{\"detailType\":\"complete\",\"count\":1,\"consumer_key\":null,\"access_token\":\"access_token\"}",
        headers: {
          "Content-Type" => "application/json",
          "User-Agent" => "Pocket Ruby Gem #{Pocket::VERSION}"
        }
      )
      .to_return(status: 200, body: "body response", headers: {})
    client = Pocket.client(access_token: "access_token")

    result = client.retrieve(detailType: :complete, count: 1)

    assert_equal "body response", result
  end

  test "favorite" do
    success_response = '{"action_results":[true],"status":1}'

    stub_request(:post, "https://getpocket.com/v3/send")
      .with(
        body: "{\"actions\":[{\"action\":\"favorite\",\"item_id\":\"123456\"}],\"consumer_key\":null,\"access_token\":\"access_token\"}",
        headers: {
          "Content-Type" => "application/json",
          "User-Agent" => "Pocket Ruby Gem #{Pocket::VERSION}"
        }
      )
      .to_return(status: 200, body: success_response, headers: {})
    client = Pocket.client(access_token: "access_token")

    result = client.favorite("123456")

    assert_equal success_response, result
  end

  test "unfavorite" do
    success_response = '{"action_results":[true],"status":1}'

    stub_request(:post, "https://getpocket.com/v3/send")
      .with(
        body: "{\"actions\":[{\"action\":\"unfavorite\",\"item_id\":\"123456\"}],\"consumer_key\":null,\"access_token\":\"access_token\"}",
        headers: {
          "Content-Type" => "application/json",
          "User-Agent" => "Pocket Ruby Gem #{Pocket::VERSION}"
        }
      )
      .to_return(status: 200, body: success_response, headers: {})
    client = Pocket.client(access_token: "access_token")

    result = client.unfavorite("123456")

    assert_equal success_response, result
  end
end
