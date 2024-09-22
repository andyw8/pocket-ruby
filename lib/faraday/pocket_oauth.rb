require "faraday"

# @private
module FaradayMiddleware
  # @private
  class PocketOAuth < Faraday::Response::Middleware
    def call(env)
      env.params[:consumer_key] = @consumer_key if env.params.nil? || !env.params.has_key?(:consumer_key)

      if @access_token
        env.params[:access_token] = @access_token
      end

      @app.call(env) do |scoped_env|
        scoped_env[:params] = env.params.dup
      end
    end

    def initialize(app, consumer_key, access_token = nil)
      @app = app
      @consumer_key = consumer_key
      @access_token = access_token
    end
  end
end
