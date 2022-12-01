# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `public_suffix` gem.
# Please instead update this file by running `bin/tapioca gem public_suffix`.

# PublicSuffix is a Ruby domain name parser based on the Public Suffix List.
#
# The [Public Suffix List](https://publicsuffix.org) is a cross-vendor initiative
# to provide an accurate list of domain name suffixes.
#
# The Public Suffix List is an initiative of the Mozilla Project,
# but is maintained as a community resource. It is available for use in any software,
# but was originally created to meet the needs of browser manufacturers.
module PublicSuffix
  class << self
    # private
    #
    # source://public_suffix//lib/public_suffix.rb#151
    def decompose(name, rule); end

    # Attempt to parse the name and returns the domain, if valid.
    #
    # This method doesn't raise. Instead, it returns nil if the domain is not valid for whatever reason.
    #
    # @param name [String, #to_s] The domain name or fully qualified domain name to parse.
    # @param list [PublicSuffix::List] The rule list to search, defaults to the default {PublicSuffix::List}
    # @param ignore_private [Boolean]
    # @return [String]
    #
    # source://public_suffix//lib/public_suffix.rb#142
    def domain(name, **options); end

    # Pretend we know how to deal with user input.
    #
    # source://public_suffix//lib/public_suffix.rb#166
    def normalize(name); end

    # Parses +name+ and returns the {PublicSuffix::Domain} instance.
    #
    # @example Parse a valid domain
    #   PublicSuffix.parse("google.com")
    #   # => #<PublicSuffix::Domain:0x007fec2e51e588 @sld="google", @tld="com", @trd=nil>
    # @example Parse a valid subdomain
    #   PublicSuffix.parse("www.google.com")
    #   # => #<PublicSuffix::Domain:0x007fec276d4cf8 @sld="google", @tld="com", @trd="www">
    # @example Parse a fully qualified domain
    #   PublicSuffix.parse("google.com.")
    #   # => #<PublicSuffix::Domain:0x007fec257caf38 @sld="google", @tld="com", @trd=nil>
    # @example Parse a fully qualified domain (subdomain)
    #   PublicSuffix.parse("www.google.com.")
    #   # => #<PublicSuffix::Domain:0x007fec27b6bca8 @sld="google", @tld="com", @trd="www">
    # @example Parse an invalid (unlisted) domain
    #   PublicSuffix.parse("x.yz")
    #   # => #<PublicSuffix::Domain:0x007fec2f49bec0 @sld="x", @tld="yz", @trd=nil>
    # @example Parse an invalid (unlisted) domain with strict checking (without applying the default * rule)
    #   PublicSuffix.parse("x.yz", default_rule: nil)
    #   # => PublicSuffix::DomainInvalid: `x.yz` is not a valid domain
    # @example Parse an URL (not supported, only domains)
    #   PublicSuffix.parse("http://www.google.com")
    #   # => PublicSuffix::DomainInvalid: http://www.google.com is not expected to contain a scheme
    # @param name [String, #to_s] The domain name or fully qualified domain name to parse.
    # @param list [PublicSuffix::List] The rule list to search, defaults to the default {PublicSuffix::List}
    # @param ignore_private [Boolean]
    # @raise [PublicSuffix::DomainInvalid] If domain is not a valid domain.
    # @raise [PublicSuffix::DomainNotAllowed] If a rule for +domain+ is found, but the rule doesn't allow +domain+.
    # @return [PublicSuffix::Domain]
    #
    # source://public_suffix//lib/public_suffix.rb#69
    def parse(name, list: T.unsafe(nil), default_rule: T.unsafe(nil), ignore_private: T.unsafe(nil)); end

    # Checks whether +domain+ is assigned and allowed, without actually parsing it.
    #
    # This method doesn't care whether domain is a domain or subdomain.
    # The validation is performed using the default {PublicSuffix::List}.
    #
    # @example Validate a valid domain
    #   PublicSuffix.valid?("example.com")
    #   # => true
    # @example Validate a valid subdomain
    #   PublicSuffix.valid?("www.example.com")
    #   # => true
    # @example Validate a not-listed domain
    #   PublicSuffix.valid?("example.tldnotlisted")
    #   # => true
    # @example Validate a not-listed domain with strict checking (without applying the default * rule)
    #   PublicSuffix.valid?("example.tldnotlisted")
    #   # => true
    #   PublicSuffix.valid?("example.tldnotlisted", default_rule: nil)
    #   # => false
    # @example Validate a fully qualified domain
    #   PublicSuffix.valid?("google.com.")
    #   # => true
    #   PublicSuffix.valid?("www.google.com.")
    #   # => true
    # @example Check an URL (which is not a valid domain)
    #   PublicSuffix.valid?("http://www.example.com")
    #   # => false
    # @param name [String, #to_s] The domain name or fully qualified domain name to validate.
    # @param ignore_private [Boolean]
    # @return [Boolean]
    #
    # source://public_suffix//lib/public_suffix.rb#125
    def valid?(name, list: T.unsafe(nil), default_rule: T.unsafe(nil), ignore_private: T.unsafe(nil)); end
  end
end

# source://public_suffix//lib/public_suffix.rb#26
PublicSuffix::BANG = T.let(T.unsafe(nil), String)

# source://public_suffix//lib/public_suffix.rb#25
PublicSuffix::DOT = T.let(T.unsafe(nil), String)

# Domain represents a domain name, composed by a TLD, SLD and TRD.
class PublicSuffix::Domain
  # Creates and returns a new {PublicSuffix::Domain} instance.
  #
  # @example Initialize with a TLD and SLD
  #   PublicSuffix::Domain.new("com", "example")
  #   # => #<PublicSuffix::Domain @tld="com", @trd=nil>
  # @example Initialize with a TLD
  #   PublicSuffix::Domain.new("com")
  #   # => #<PublicSuffix::Domain @tld="com">
  # @example Initialize with a TLD, SLD and TRD
  #   PublicSuffix::Domain.new("com", "example", "wwww")
  #   # => #<PublicSuffix::Domain @tld="com", @trd=nil, @sld="example">
  # @overload initialize
  # @overload initialize
  # @overload initialize
  # @return [Domain] a new instance of Domain
  # @yield [self] Yields on self.
  # @yieldparam self [PublicSuffix::Domain] The newly creates instance
  #
  # source://public_suffix//lib/public_suffix/domain.rb#65
  def initialize(*args); end

  # Returns a domain-like representation of this object
  # if the object is a {#domain?}, <tt>nil</tt> otherwise.
  #
  #   PublicSuffix::Domain.new("com").domain
  #   # => nil
  #
  #   PublicSuffix::Domain.new("com", "google").domain
  #   # => "google.com"
  #
  #   PublicSuffix::Domain.new("com", "google", "www").domain
  #   # => "www.google.com"
  #
  # This method doesn't validate the input. It handles the domain
  # as a valid domain name and simply applies the necessary transformations.
  #
  # This method returns a FQD, not just the domain part.
  # To get the domain part, use <tt>#sld</tt> (aka second level domain).
  #
  #   PublicSuffix::Domain.new("com", "google", "www").domain
  #   # => "google.com"
  #
  #   PublicSuffix::Domain.new("com", "google", "www").sld
  #   # => "google"
  #
  # @return [String]
  # @see #domain?
  # @see #subdomain
  #
  # source://public_suffix//lib/public_suffix/domain.rb#137
  def domain; end

  # Checks whether <tt>self</tt> looks like a domain.
  #
  # This method doesn't actually validate the domain.
  # It only checks whether the instance contains
  # a value for the {#tld} and {#sld} attributes.
  #
  # @example
  #
  #   PublicSuffix::Domain.new("com").domain?
  #   # => false
  #
  #   PublicSuffix::Domain.new("com", "google").domain?
  #   # => true
  #
  #   PublicSuffix::Domain.new("com", "google", "www").domain?
  #   # => true
  #
  #   # This is an invalid domain, but returns true
  #   # because this method doesn't validate the content.
  #   PublicSuffix::Domain.new("com", nil).domain?
  #   # => true
  # @return [Boolean]
  # @see #subdomain?
  #
  # source://public_suffix//lib/public_suffix/domain.rb#198
  def domain?; end

  # Returns the full domain name.
  #
  # @example Gets the domain name of a domain
  #   PublicSuffix::Domain.new("com", "google").name
  #   # => "google.com"
  # @example Gets the domain name of a subdomain
  #   PublicSuffix::Domain.new("com", "google", "www").name
  #   # => "www.google.com"
  # @return [String]
  #
  # source://public_suffix//lib/public_suffix/domain.rb#105
  def name; end

  # Returns the value of attribute sld.
  #
  # source://public_suffix//lib/public_suffix/domain.rb#33
  def sld; end

  # Returns a subdomain-like representation of this object
  # if the object is a {#subdomain?}, <tt>nil</tt> otherwise.
  #
  #   PublicSuffix::Domain.new("com").subdomain
  #   # => nil
  #
  #   PublicSuffix::Domain.new("com", "google").subdomain
  #   # => nil
  #
  #   PublicSuffix::Domain.new("com", "google", "www").subdomain
  #   # => "www.google.com"
  #
  # This method doesn't validate the input. It handles the domain
  # as a valid domain name and simply applies the necessary transformations.
  #
  # This method returns a FQD, not just the subdomain part.
  # To get the subdomain part, use <tt>#trd</tt> (aka third level domain).
  #
  #   PublicSuffix::Domain.new("com", "google", "www").subdomain
  #   # => "www.google.com"
  #
  #   PublicSuffix::Domain.new("com", "google", "www").trd
  #   # => "www"
  #
  # @return [String]
  # @see #subdomain?
  # @see #domain
  #
  # source://public_suffix//lib/public_suffix/domain.rb#169
  def subdomain; end

  # Checks whether <tt>self</tt> looks like a subdomain.
  #
  # This method doesn't actually validate the subdomain.
  # It only checks whether the instance contains
  # a value for the {#tld}, {#sld} and {#trd} attributes.
  # If you also want to validate the domain,
  # use {#valid_subdomain?} instead.
  #
  # @example
  #
  #   PublicSuffix::Domain.new("com").subdomain?
  #   # => false
  #
  #   PublicSuffix::Domain.new("com", "google").subdomain?
  #   # => false
  #
  #   PublicSuffix::Domain.new("com", "google", "www").subdomain?
  #   # => true
  #
  #   # This is an invalid domain, but returns true
  #   # because this method doesn't validate the content.
  #   PublicSuffix::Domain.new("com", "example", nil).subdomain?
  #   # => true
  # @return [Boolean]
  # @see #domain?
  #
  # source://public_suffix//lib/public_suffix/domain.rb#229
  def subdomain?; end

  # Returns the value of attribute tld.
  #
  # source://public_suffix//lib/public_suffix/domain.rb#33
  def tld; end

  # Returns an array containing the domain parts.
  #
  # @example
  #
  #   PublicSuffix::Domain.new("google.com").to_a
  #   # => [nil, "google", "com"]
  #
  #   PublicSuffix::Domain.new("www.google.com").to_a
  #   # => [nil, "google", "com"]
  # @return [Array<String, nil>]
  #
  # source://public_suffix//lib/public_suffix/domain.rb#89
  def to_a; end

  # Returns a string representation of this object.
  #
  # @return [String]
  #
  # source://public_suffix//lib/public_suffix/domain.rb#73
  def to_s; end

  # Returns the value of attribute trd.
  #
  # source://public_suffix//lib/public_suffix/domain.rb#33
  def trd; end

  class << self
    # Splits a string into the labels, that is the dot-separated parts.
    #
    # The input is not validated, but it is assumed to be a valid domain name.
    #
    # @example
    #
    #   name_to_labels('example.com')
    #   # => ['example', 'com']
    #
    #   name_to_labels('example.co.uk')
    #   # => ['example', 'co', 'uk']
    # @param name [String, #to_s] The domain name to split.
    # @return [Array<String>]
    #
    # source://public_suffix//lib/public_suffix/domain.rb#28
    def name_to_labels(name); end
  end
end

# Raised when trying to parse an invalid name.
# A name is considered invalid when no rule is found in the definition list.
#
# @example
#
#   PublicSuffix.parse("nic.test")
#   # => PublicSuffix::DomainInvalid
#
#   PublicSuffix.parse("http://www.nic.it")
#   # => PublicSuffix::DomainInvalid
class PublicSuffix::DomainInvalid < ::PublicSuffix::Error; end

# Raised when trying to parse a name that matches a suffix.
#
# @example
#
#   PublicSuffix.parse("nic.do")
#   # => PublicSuffix::DomainNotAllowed
#
#   PublicSuffix.parse("www.nic.do")
#   # => PublicSuffix::Domain
class PublicSuffix::DomainNotAllowed < ::PublicSuffix::DomainInvalid; end

class PublicSuffix::Error < ::StandardError; end

# A {PublicSuffix::List} is a collection of one
# or more {PublicSuffix::Rule}.
#
# Given a {PublicSuffix::List},
# you can add or remove {PublicSuffix::Rule},
# iterate all items in the list or search for the first rule
# which matches a specific domain name.
#
#   # Create a new list
#   list =  PublicSuffix::List.new
#
#   # Push two rules to the list
#   list << PublicSuffix::Rule.factory("it")
#   list << PublicSuffix::Rule.factory("com")
#
#   # Get the size of the list
#   list.size
#   # => 2
#
#   # Search for the rule matching given domain
#   list.find("example.com")
#   # => #<PublicSuffix::Rule::Normal>
#   list.find("example.org")
#   # => nil
#
# You can create as many {PublicSuffix::List} you want.
# The {PublicSuffix::List.default} rule list is used
# to tokenize and validate a domain.
class PublicSuffix::List
  # Initializes an empty {PublicSuffix::List}.
  #
  # @return [List] a new instance of List
  # @yield [self] Yields on self.
  # @yieldparam self [PublicSuffix::List] The newly created instance.
  #
  # source://public_suffix//lib/public_suffix/list.rb#106
  def initialize; end

  # Adds the given object to the list and optionally refreshes the rule index.
  #
  # @param rule [PublicSuffix::Rule::*] the rule to add to the list
  # @return [self]
  #
  # source://public_suffix//lib/public_suffix/list.rb#141
  def <<(rule); end

  # Checks whether two lists are equal.
  #
  # List <tt>one</tt> is equal to <tt>two</tt>, if <tt>two</tt> is an instance of
  # {PublicSuffix::List} and each +PublicSuffix::Rule::*+
  # in list <tt>one</tt> is available in list <tt>two</tt>, in the same order.
  #
  # @param other [PublicSuffix::List] the List to compare
  # @return [Boolean]
  #
  # source://public_suffix//lib/public_suffix/list.rb#120
  def ==(other); end

  # Adds the given object to the list and optionally refreshes the rule index.
  #
  # @param rule [PublicSuffix::Rule::*] the rule to add to the list
  # @return [self]
  #
  # source://public_suffix//lib/public_suffix/list.rb#141
  def add(rule); end

  # Removes all rules.
  #
  # @return [self]
  #
  # source://public_suffix//lib/public_suffix/list.rb#164
  def clear; end

  # Gets the default rule.
  #
  # @return [PublicSuffix::Rule::*]
  # @see PublicSuffix::Rule.default_rule
  #
  # source://public_suffix//lib/public_suffix/list.rb#226
  def default_rule; end

  # Iterates each rule in the list.
  #
  # source://public_suffix//lib/public_suffix/list.rb#128
  def each(&block); end

  # Checks whether the list is empty.
  #
  # @return [Boolean]
  #
  # source://public_suffix//lib/public_suffix/list.rb#157
  def empty?; end

  # Checks whether two lists are equal.
  #
  # List <tt>one</tt> is equal to <tt>two</tt>, if <tt>two</tt> is an instance of
  # {PublicSuffix::List} and each +PublicSuffix::Rule::*+
  # in list <tt>one</tt> is available in list <tt>two</tt>, in the same order.
  #
  # @param other [PublicSuffix::List] the List to compare
  # @return [Boolean]
  #
  # source://public_suffix//lib/public_suffix/list.rb#120
  def eql?(other); end

  # Finds and returns the rule corresponding to the longest public suffix for the hostname.
  #
  # @param name [#to_s] the hostname
  # @param default [PublicSuffix::Rule::*] the default rule to return in case no rule matches
  # @return [PublicSuffix::Rule::*]
  #
  # source://public_suffix//lib/public_suffix/list.rb#174
  def find(name, default: T.unsafe(nil), **options); end

  # Gets the number of rules in the list.
  #
  # @return [Integer]
  #
  # source://public_suffix//lib/public_suffix/list.rb#150
  def size; end

  protected

  # Returns the value of attribute rules.
  #
  # source://public_suffix//lib/public_suffix/list.rb#233
  def rules; end

  private

  # source://public_suffix//lib/public_suffix/list.rb#238
  def entry_to_rule(entry, value); end

  # source://public_suffix//lib/public_suffix/list.rb#242
  def rule_to_entry(rule); end

  # Selects all the rules matching given hostame.
  #
  # If `ignore_private` is set to true, the algorithm will skip the rules that are flagged as
  # private domain. Note that the rules will still be part of the loop.
  # If you frequently need to access lists ignoring the private domains,
  # you should create a list that doesn't include these domains setting the
  # `private_domains: false` option when calling {.parse}.
  #
  # Note that this method is currently private, as you should not rely on it. Instead,
  # the public interface is {#find}. The current internal algorithm allows to return all
  # matching rules, but different data structures may not be able to do it, and instead would
  # return only the match. For this reason, you should rely on {#find}.
  #
  # @param name [#to_s] the hostname
  # @param ignore_private [Boolean]
  # @return [Array<PublicSuffix::Rule::*>]
  #
  # source://public_suffix//lib/public_suffix/list.rb#199
  def select(name, ignore_private: T.unsafe(nil)); end

  class << self
    # Gets the default rule list.
    #
    # Initializes a new {PublicSuffix::List} parsing the content
    # of {PublicSuffix::List.default_list_content}, if required.
    #
    # @return [PublicSuffix::List]
    #
    # source://public_suffix//lib/public_suffix/list.rb#50
    def default(**options); end

    # Sets the default rule list to +value+.
    #
    # @param value [PublicSuffix::List] the new list
    # @return [PublicSuffix::List]
    #
    # source://public_suffix//lib/public_suffix/list.rb#58
    def default=(value); end

    # Parse given +input+ treating the content as Public Suffix List.
    #
    # See http://publicsuffix.org/format/ for more details about input format.
    #
    # @param string [#each_line] the list to parse
    # @param private_domains [Boolean] whether to ignore the private domains section
    # @return [PublicSuffix::List]
    #
    # source://public_suffix//lib/public_suffix/list.rb#69
    def parse(input, private_domains: T.unsafe(nil)); end
  end
end

# source://public_suffix//lib/public_suffix/list.rb#42
PublicSuffix::List::DEFAULT_LIST_PATH = T.let(T.unsafe(nil), String)

# A Rule is a special object which holds a single definition
# of the Public Suffix List.
#
# There are 3 types of rules, each one represented by a specific
# subclass within the +PublicSuffix::Rule+ namespace.
#
# To create a new Rule, use the {PublicSuffix::Rule#factory} method.
#
#   PublicSuffix::Rule.factory("ar")
#   # => #<PublicSuffix::Rule::Normal>
module PublicSuffix::Rule
  class << self
    # The default rule to use if no rule match.
    #
    # The default rule is "*". From https://publicsuffix.org/list/:
    #
    # > If no rules match, the prevailing rule is "*".
    #
    # @return [PublicSuffix::Rule::Wildcard] The default rule.
    #
    # source://public_suffix//lib/public_suffix/rule.rb#344
    def default; end

    # Takes the +name+ of the rule, detects the specific rule class
    # and creates a new instance of that class.
    # The +name+ becomes the rule +value+.
    #
    # @example Creates a Normal rule
    #   PublicSuffix::Rule.factory("ar")
    #   # => #<PublicSuffix::Rule::Normal>
    # @example Creates a Wildcard rule
    #   PublicSuffix::Rule.factory("*.ar")
    #   # => #<PublicSuffix::Rule::Wildcard>
    # @example Creates an Exception rule
    #   PublicSuffix::Rule.factory("!congresodelalengua3.ar")
    #   # => #<PublicSuffix::Rule::Exception>
    # @param content [String] The rule content.
    # @return [PublicSuffix::Rule::*] A rule instance.
    #
    # source://public_suffix//lib/public_suffix/rule.rb#326
    def factory(content, private: T.unsafe(nil)); end
  end
end

# = Abstract rule class
#
# This represent the base class for a Rule definition
# in the {Public Suffix List}[https://publicsuffix.org].
#
# This is intended to be an Abstract class
# and you shouldn't create a direct instance. The only purpose
# of this class is to expose a common interface
# for all the available subclasses.
#
# * {PublicSuffix::Rule::Normal}
# * {PublicSuffix::Rule::Exception}
# * {PublicSuffix::Rule::Wildcard}
#
# ## Properties
#
# A rule is composed by 4 properties:
#
# value   - A normalized version of the rule name.
#           The normalization process depends on rule tpe.
#
# Here's an example
#
#   PublicSuffix::Rule.factory("*.google.com")
#   #<PublicSuffix::Rule::Wildcard:0x1015c14b0
#       @value="google.com"
#   >
#
# ## Rule Creation
#
# The best way to create a new rule is passing the rule name
# to the <tt>PublicSuffix::Rule.factory</tt> method.
#
#   PublicSuffix::Rule.factory("com")
#   # => PublicSuffix::Rule::Normal
#
#   PublicSuffix::Rule.factory("*.com")
#   # => PublicSuffix::Rule::Wildcard
#
# This method will detect the rule type and create an instance
# from the proper rule class.
#
# ## Rule Usage
#
# A rule describes the composition of a domain name and explains how to tokenize
# the name into tld, sld and trd.
#
# To use a rule, you first need to be sure the name you want to tokenize
# can be handled by the current rule.
# You can use the <tt>#match?</tt> method.
#
#   rule = PublicSuffix::Rule.factory("com")
#
#   rule.match?("google.com")
#   # => true
#
#   rule.match?("google.com")
#   # => false
#
# Rule order is significant. A name can match more than one rule.
# See the {Public Suffix Documentation}[http://publicsuffix.org/format/]
# to learn more about rule priority.
#
# When you have the right rule, you can use it to tokenize the domain name.
#
#   rule = PublicSuffix::Rule.factory("com")
#
#   rule.decompose("google.com")
#   # => ["google", "com"]
#
#   rule.decompose("www.google.com")
#   # => ["www.google", "com"]
#
# @abstract
class PublicSuffix::Rule::Base
  # Initializes a new rule.
  #
  # @param value [String]
  # @param private [Boolean]
  # @return [Base] a new instance of Base
  #
  # source://public_suffix//lib/public_suffix/rule.rb#126
  def initialize(value:, length: T.unsafe(nil), private: T.unsafe(nil)); end

  # Checks whether this rule is equal to <tt>other</tt>.
  #
  # @param other [PublicSuffix::Rule::*] The rule to compare
  # @return [Boolean] Returns true if this rule and other are instances of the same class
  #   and has the same value, false otherwise.
  #
  # source://public_suffix//lib/public_suffix/rule.rb#138
  def ==(other); end

  # @abstract
  # @param name [String, #to_s] The domain name to decompose
  # @raise [NotImplementedError]
  # @return [Array<String, nil>]
  #
  # source://public_suffix//lib/public_suffix/rule.rb#181
  def decompose(*_arg0); end

  # Checks whether this rule is equal to <tt>other</tt>.
  #
  # @param other [PublicSuffix::Rule::*] The rule to compare
  # @return [Boolean] Returns true if this rule and other are instances of the same class
  #   and has the same value, false otherwise.
  #
  # source://public_suffix//lib/public_suffix/rule.rb#138
  def eql?(other); end

  # @return [String] the length of the rule
  #
  # source://public_suffix//lib/public_suffix/rule.rb#108
  def length; end

  # Checks if this rule matches +name+.
  #
  # A domain name is said to match a rule if and only if
  # all of the following conditions are met:
  #
  # - When the domain and rule are split into corresponding labels,
  #   that the domain contains as many or more labels than the rule.
  # - Beginning with the right-most labels of both the domain and the rule,
  #   and continuing for all labels in the rule, one finds that for every pair,
  #   either they are identical, or that the label from the rule is "*".
  #
  # @example
  #   PublicSuffix::Rule.factory("com").match?("example.com")
  #   # => true
  #   PublicSuffix::Rule.factory("com").match?("example.net")
  #   # => false
  # @param name [String] the domain name to check
  # @return [Boolean]
  # @see https://publicsuffix.org/list/
  #
  # source://public_suffix//lib/public_suffix/rule.rb#164
  def match?(name); end

  # @abstract
  # @raise [NotImplementedError]
  #
  # source://public_suffix//lib/public_suffix/rule.rb#174
  def parts; end

  # @return [Boolean] true if the rule is a private domain
  #
  # source://public_suffix//lib/public_suffix/rule.rb#111
  def private; end

  # @return [String] the rule definition
  #
  # source://public_suffix//lib/public_suffix/rule.rb#105
  def value; end

  class << self
    # Initializes a new rule from the content.
    #
    # @param content [String] the content of the rule
    # @param private [Boolean]
    #
    # source://public_suffix//lib/public_suffix/rule.rb#118
    def build(content, private: T.unsafe(nil)); end
  end
end

# @api internal
class PublicSuffix::Rule::Entry < ::Struct
  # Returns the value of attribute length
  #
  # @return [Object] the current value of length
  def length; end

  # Sets the attribute length
  #
  # @param value [Object] the value to set the attribute length to.
  # @return [Object] the newly set value
  def length=(_); end

  # Returns the value of attribute private
  #
  # @return [Object] the current value of private
  def private; end

  # Sets the attribute private
  #
  # @param value [Object] the value to set the attribute private to.
  # @return [Object] the newly set value
  def private=(_); end

  # Returns the value of attribute type
  #
  # @return [Object] the current value of type
  def type; end

  # Sets the attribute type
  #
  # @param value [Object] the value to set the attribute type to.
  # @return [Object] the newly set value
  def type=(_); end

  class << self
    def [](*_arg0); end
    def inspect; end
    def keyword_init?; end
    def members; end
    def new(*_arg0); end
  end
end

# Exception represents an exception rule (e.g. !parliament.uk).
class PublicSuffix::Rule::Exception < ::PublicSuffix::Rule::Base
  # Decomposes the domain name according to rule properties.
  #
  # @param name [String, #to_s] The domain name to decompose
  # @return [Array<String>] The array with [trd + sld, tld].
  #
  # source://public_suffix//lib/public_suffix/rule.rb#286
  def decompose(domain); end

  # dot-split rule value and returns all rule parts
  # in the order they appear in the value.
  # The leftmost label is not considered a label.
  #
  # See http://publicsuffix.org/format/:
  # If the prevailing rule is a exception rule,
  # modify it by removing the leftmost label.
  #
  # @return [Array<String>]
  #
  # source://public_suffix//lib/public_suffix/rule.rb#301
  def parts; end

  # Gets the original rule definition.
  #
  # @return [String] The rule definition.
  #
  # source://public_suffix//lib/public_suffix/rule.rb#278
  def rule; end

  class << self
    # Initializes a new rule from the content.
    #
    # @param content [String] the content of the rule
    # @param private [Boolean]
    #
    # source://public_suffix//lib/public_suffix/rule.rb#271
    def build(content, private: T.unsafe(nil)); end
  end
end

# Normal represents a standard rule (e.g. com).
class PublicSuffix::Rule::Normal < ::PublicSuffix::Rule::Base
  # Decomposes the domain name according to rule properties.
  #
  # @param name [String, #to_s] The domain name to decompose
  # @return [Array<String>] The array with [trd + sld, tld].
  #
  # source://public_suffix//lib/public_suffix/rule.rb#201
  def decompose(domain); end

  # dot-split rule value and returns all rule parts
  # in the order they appear in the value.
  #
  # @return [Array<String>]
  #
  # source://public_suffix//lib/public_suffix/rule.rb#211
  def parts; end

  # Gets the original rule definition.
  #
  # @return [String] The rule definition.
  #
  # source://public_suffix//lib/public_suffix/rule.rb#193
  def rule; end
end

# Wildcard represents a wildcard rule (e.g. *.co.uk).
class PublicSuffix::Rule::Wildcard < ::PublicSuffix::Rule::Base
  # Initializes a new rule.
  #
  # @param value [String]
  # @param private [Boolean]
  # @return [Wildcard] a new instance of Wildcard
  #
  # source://public_suffix//lib/public_suffix/rule.rb#232
  def initialize(value:, length: T.unsafe(nil), private: T.unsafe(nil)); end

  # Decomposes the domain name according to rule properties.
  #
  # @param name [String, #to_s] The domain name to decompose
  # @return [Array<String>] The array with [trd + sld, tld].
  #
  # source://public_suffix//lib/public_suffix/rule.rb#248
  def decompose(domain); end

  # dot-split rule value and returns all rule parts
  # in the order they appear in the value.
  #
  # @return [Array<String>]
  #
  # source://public_suffix//lib/public_suffix/rule.rb#258
  def parts; end

  # Gets the original rule definition.
  #
  # @return [String] The rule definition.
  #
  # source://public_suffix//lib/public_suffix/rule.rb#240
  def rule; end

  class << self
    # Initializes a new rule from the content.
    #
    # @param content [String] the content of the rule
    # @param private [Boolean]
    #
    # source://public_suffix//lib/public_suffix/rule.rb#224
    def build(content, private: T.unsafe(nil)); end
  end
end

# source://public_suffix//lib/public_suffix.rb#27
PublicSuffix::STAR = T.let(T.unsafe(nil), String)

# The current library version.
#
# source://public_suffix//lib/public_suffix/version.rb#12
PublicSuffix::VERSION = T.let(T.unsafe(nil), String)
