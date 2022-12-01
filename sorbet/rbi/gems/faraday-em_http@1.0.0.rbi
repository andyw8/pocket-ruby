# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `faraday-em_http` gem.
# Please instead update this file by running `bin/tapioca gem faraday-em_http`.

# EventMachine adapter. This adapter is useful for either asynchronous
# requests when in an EM reactor loop, or for making parallel requests in
# synchronous code.
class Faraday::Adapter::EMHttp < ::Faraday::Adapter
  include ::Faraday::Adapter::EMHttp::Options

  # source://faraday-em_http//lib/faraday/adapter/em_http.rb#116
  def call(env); end

  # source://faraday-em_http//lib/faraday/adapter/em_http.rb#190
  def create_request(env); end

  # source://faraday-em_http//lib/faraday/adapter/em_http.rb#196
  def error_message(client); end

  # @return [Boolean]
  #
  # source://faraday-em_http//lib/faraday/adapter/em_http.rb#220
  def parallel?(env); end

  # source://faraday-em_http//lib/faraday/adapter/em_http.rb#122
  def perform_request(env); end

  # TODO: reuse the connection to support pipelining
  #
  # source://faraday-em_http//lib/faraday/adapter/em_http.rb#168
  def perform_single_request(env); end

  # @raise [error_class]
  #
  # source://faraday-em_http//lib/faraday/adapter/em_http.rb#200
  def raise_error(msg); end

  # @return [Boolean]
  #
  # source://faraday-em_http//lib/faraday/adapter/em_http.rb#214
  def timeout_message?(msg); end

  class << self
    # @return [Manager]
    #
    # source://faraday-em_http//lib/faraday/adapter/em_http.rb#112
    def setup_parallel_manager(_options = T.unsafe(nil)); end
  end
end

# This parallel manager is designed to start an EventMachine loop
# and block until all registered requests have been completed.
class Faraday::Adapter::EMHttp::Manager
  # @return [Manager] a new instance of Manager
  # @see reset
  #
  # source://faraday-em_http//lib/faraday/adapter/em_http.rb#228
  def initialize; end

  # source://faraday-em_http//lib/faraday/adapter/em_http.rb#246
  def add(&block); end

  # source://faraday-em_http//lib/faraday/adapter/em_http.rb#283
  def check_finished; end

  # source://faraday-em_http//lib/faraday/adapter/em_http.rb#271
  def perform_request; end

  # Re-initializes instance variables
  #
  # source://faraday-em_http//lib/faraday/adapter/em_http.rb#233
  def reset; end

  # source://faraday-em_http//lib/faraday/adapter/em_http.rb#255
  def run; end

  # @return [Boolean]
  #
  # source://faraday-em_http//lib/faraday/adapter/em_http.rb#242
  def running?; end
end

# Options is a module containing helpers to convert the Faraday env object
# into options hashes for EMHTTP method calls.
module Faraday::Adapter::EMHttp::Options
  # Reads out compression header settings from env into options
  #
  # source://faraday-em_http//lib/faraday/adapter/em_http.rb#79
  def configure_compression(options, env); end

  # Reads out proxy settings from env into options
  #
  # source://faraday-em_http//lib/faraday/adapter/em_http.rb#39
  def configure_proxy(options, env); end

  # Reads out host and port settings from env into options
  #
  # source://faraday-em_http//lib/faraday/adapter/em_http.rb#51
  def configure_socket(options, env); end

  # Reads out SSL certificate settings from env into options
  #
  # source://faraday-em_http//lib/faraday/adapter/em_http.rb#62
  def configure_ssl(options, env); end

  # Reads out timeout settings from env into options
  #
  # source://faraday-em_http//lib/faraday/adapter/em_http.rb#72
  def configure_timeout(options, env); end

  # @return [Hash]
  #
  # source://faraday-em_http//lib/faraday/adapter/em_http.rb#13
  def connection_config(env); end

  # source://faraday-em_http//lib/faraday/adapter/em_http.rb#33
  def read_body(env); end

  # source://faraday-em_http//lib/faraday/adapter/em_http.rb#22
  def request_config(env); end

  # source://faraday-em_http//lib/faraday/adapter/em_http.rb#86
  def request_options(env); end
end

# Main Faraday::EmHttp module
module Faraday::EmHttp; end

# source://faraday-em_http//lib/faraday/em_http/version.rb#5
Faraday::EmHttp::VERSION = T.let(T.unsafe(nil), String)