# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: true
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/power_assert/all/power_assert.rbi
#
# power_assert-2.0.0

module PowerAssert
  def self.app_caller_locations; end
  def self.app_context?; end
  def self.clear_global_method_cache; end
  def self.configuration; end
  def self.configure; end
  def self.internal_file?(file); end
  def self.lib_dir(obj, mid, depth); end
  def self.setup_internal_lib_dir(lib, mid, depth, lib_obj = nil); end
  def self.start(assertion_proc_or_source, assertion_method: nil, source_binding: nil); end
  def self.trace(frame); end
end
class Anonymous_Struct_8 < Struct
  def _redefinition; end
  def _redefinition=(_); end
  def colorize_message; end
  def colorize_message=(_); end
  def inspector; end
  def inspector=(_); end
  def lazy_inspection; end
  def lazy_inspection=(_); end
  def self.[](*arg0); end
  def self.inspect; end
  def self.members; end
  def self.new(*arg0); end
end
class PowerAssert::Configuration < Anonymous_Struct_8
  def colorize_message=(bool); end
  def inspector=(inspector); end
  def lazy_inspection=(bool); end
end
class PowerAssert::InspectedValue
  def initialize(value); end
  def inspect; end
end
class PowerAssert::SafeInspectable
  def initialize(value); end
  def inspect; end
end
class PowerAssert::Inspector
  def initialize(value, indent); end
  def inspect; end
end
class PowerAssert::Parser
  def binding; end
  def call_paths; end
  def collect_paths(idents, prefixes = nil, index = nil); end
  def extract_idents(sexp); end
  def handle_columnless_ident(left_idents, mid, right_idents, with_safe_op = nil); end
  def idents; end
  def initialize(line, path, lineno, binding, assertion_method_name = nil, assertion_proc = nil); end
  def line; end
  def lineno; end
  def method_id_set; end
  def path; end
  def slice_expression(str); end
  def str_indices(str, re, offset, limit); end
  def valid_syntax?(str); end
end
class PowerAssert::Parser::Ident < Struct
  def column; end
  def column=(_); end
  def name; end
  def name=(_); end
  def self.[](*arg0); end
  def self.inspect; end
  def self.members; end
  def self.new(*arg0); end
  def type; end
  def type=(_); end
end
class PowerAssert::Parser::Branch < Array
end
class PowerAssert::Parser::DummyParser < PowerAssert::Parser
  def call_paths; end
  def idents; end
  def initialize; end
end
class PowerAssert::Context
  def build_assertion_message(parser, return_values); end
  def column2display_offset(str); end
  def detect_path(parser, return_values); end
  def encoding_safe_rstrip(str); end
  def enum_count_by(enum, &blk); end
  def find_all_identified_calls(return_values, path); end
  def fired?; end
  def initialize(base_caller_length); end
  def message; end
  def message_proc; end
  def uniq_calls(paths); end
end
class PowerAssert::Context::Value < Struct
  def column; end
  def column=(_); end
  def display_offset; end
  def display_offset=(_); end
  def lineno; end
  def lineno=(_); end
  def name; end
  def name=(_); end
  def self.[](*arg0); end
  def self.inspect; end
  def self.members; end
  def self.new(*arg0); end
  def value; end
  def value=(_); end
end
class PowerAssert::BlockContext < PowerAssert::Context
  def initialize(assertion_proc_or_source, assertion_method, source_binding); end
  def invoke_yield; end
  def yield; end
end
class PowerAssert::TraceContext < PowerAssert::Context
  def disable; end
  def enable; end
  def enabled?; end
  def initialize(binding); end
end
module PowerAssert::Empty
end