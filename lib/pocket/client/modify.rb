module Pocket
  class Client
    # http://getpocket.com/developer/docs/v3/modify
    module Modify
      # required params: actions, consumer_key, access_token
      def modify params
        response = connection.post("/v3/send", params)
        response.body
      end
    end
  end
end
