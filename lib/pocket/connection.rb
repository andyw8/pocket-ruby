# frozen_string_literal: true

require 'faraday'
Dir[File.expand_path('faraday/*.rb', __dir__)].sort.each { |f| require f }

module Pocket
  # @private
  module Connection
    private

    def connection(_raw: false)
      Faraday::Connection.new(configure_options) do |conn|
        conn.use(FaradayMiddleware::PocketOAuth, consumer_key, access_token)

        conn.request :json
        conn.response :json

        conn.use(Faraday::Response::RaiseError)
        conn.adapter Faraday.default_adapter
      end
    end

    def configure_options
      {
        headers: { 'User-Agent' => user_agent, 'Content-Type' => 'application/json' },
        proxy: proxy,
        ssl: { verify: false },
        url: endpoint
      }
    end
  end
end
