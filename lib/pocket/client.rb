module Pocket
  # Wrapper for the Pocket REST API
  #
  # @note All methods have been separated into modules and follow the same grouping used in {TODO:doc_URL the Pocket API Documentation}.
  # @see TODO:doc_url
  class Client < API
    # http://getpocket.com/developer/docs/v3/add
    module Add
      # required params: url, consumer_key, access_token
      def add params
        response = connection.post("/v3/add", params)
        response.body
      end
    end

    # http://getpocket.com/developer/docs/v3/modify
    module Modify
      # required params: actions, consumer_key, access_token
      def modify actions
        response = connection.post("/v3/send", {actions: actions})
        response.body
      end
    end

    # http://getpocket.com/developer/docs/v3/retrieve
    module Retrieve
      # required params: consumer_key, access_token
      def retrieve params = {}
        response = connection.post("/v3/get", params)
        response.body
      end
    end
  end
end
