module Faraday
  #   HTTP Status X-Error-Code  X-Error
  # 400 138 Missing consumer key.
  # 403 152 Invalid consumer key.
  # 400 181 Invalid redirect uri.
  # 400 182 Missing code.
  # 400 185 Code not found.
  # 403 158 User rejected code.
  # 403 159 Already used code.
  # 50X 199 Pocket server issue.
  #
  # @see http://getpocket.com/developer/docs/authentication
  class Response::RaisePocketError < Response::Middleware
    CLIENT_ERROR_STATUSES = 400...600

    def on_complete(env)
      case env[:status]
      when 404
        raise Faraday::ResourceNotFound, response_values(env)
      when 400..403
        raise Pocket::Error, env[:response_headers]["X-Error"]
      when CLIENT_ERROR_STATUSES
        raise Faraday::ClientError, response_values(env)
      end
    end

    def response_values(env)
      {status: env[:status], headers: env[:response_headers], body: env[:body]}
    end
  end
end
