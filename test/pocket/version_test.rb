require "test_helper"

module Pocket
  class VersionTest < Test::Unit::TestCase
    def test_specifies_a_version
      assert Pocket::VERSION
    end
  end
end
