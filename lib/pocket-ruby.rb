require File.expand_path("../pocket/error", __FILE__)
require File.expand_path("../pocket/configuration", __FILE__)
require File.expand_path("../pocket/api", __FILE__)
require File.expand_path("../pocket/client", __FILE__)
require File.expand_path("../pocket/article", __FILE__)
require File.expand_path("../pocket/author", __FILE__)
require File.expand_path("../pocket/domain_metadata", __FILE__)
require File.expand_path("../pocket/image", __FILE__)

module Pocket
  extend Configuration

  # Alias for Pocket::Client.new
  #
  # @return [Pocket::Client]
  def self.client(options = {})
    Pocket::Client.new(options)
  end
end
