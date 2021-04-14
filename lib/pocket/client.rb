# typed: true
module Pocket
  # Wrapper for the Pocket REST API
  class Client < API
    # http://getpocket.com/developer/docs/v3/add
    # required params: url, consumer_key, access_token
    def add params
      response = connection.post("/v3/add", params)
      response.body
    end

    # http://getpocket.com/developer/docs/v3/modify
    # required params: actions, consumer_key, access_token
    def modify actions
      response = connection.post("/v3/send", {actions: actions})
      response.body
    end

    # http://getpocket.com/developer/docs/v3/retrieve
    # required params: consumer_key, access_token
    def retrieve params = {}
      response = connection.post("/v3/get", params)
      response.body
    end
  end
end
