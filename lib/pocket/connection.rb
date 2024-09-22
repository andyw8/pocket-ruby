# frozen_string_literal: true

require 'faraday'
# require 'faraday_middleware'

Dir[File.expand_path('faraday/*.rb', __dir__)].sort.each { |f| require f }

module Pocket
  # @private
  module Connection
    private

    def connection(_raw: false)
      Faraday::Connection.new(configure_options) do |conn|
        conn.response :json, content_type: /\bjson$/
        conn.use :json
        conn.use Faraday::OAuth, consumer_key, access_token
        conn.use Faraday::Response::RaiseError

        conn.adapter Faraday.default_adapter
      end
    end

    def configure_options
      {
        headers: { 'User-Agent' => user_agent },
        proxy: proxy,
        ssl: { verify: false },
        url: endpoint
      }
    end
  end
end
