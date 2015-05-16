module Pocket
  class Client
    # http://getpocket.com/developer/docs/v3/modify
    module Modify
      # required params: actions, consumer_key, access_token
      def modify actions, params
        response = connection.post("/v3/send", {actions: actions}.merge(params))
        response.body
      end
    end
  end
end
