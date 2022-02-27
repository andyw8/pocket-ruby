require "test_helper"

module Pocket
  class VersionTest < ActiveSupport::TestCase
    def test_specifies_a_version
      assert Pocket::VERSION
    end
  end
end
