require "test_helper"
require "webmock/test_unit"

class ClientTest < Test::Unit::TestCase
  test "retrieve" do
    stub_request(:post, "https://getpocket.com/v3/get")
      .with(
        body: "{\"detailType\":\"complete\",\"count\":1,\"consumer_key\":null,\"access_token\":\"access_token\"}",
        headers: {
          "Accept" => "*/*",
          "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
          "Content-Type" => "application/json",
          "User-Agent" => "Pocket Ruby Gem 0.3.0"
        }
      )
      .to_return(status: 200, body: "body response", headers: {})
    client = Pocket.client(access_token: "access_token")

    result = client.retrieve(detailType: :complete, count: 1)

    assert_equal "body response", result
  end
end
