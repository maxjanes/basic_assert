require 'basic_assert/version'
require 'basic_assert/exception_raiser'
require 'basic_assert/basic_asserter'
require 'basic_assert/noop_asserter'

# require_relative '../../lib/asserts'
#
# class Object
#   case Rails.configuration.assert_mode
#   when :raise
#     include AssertType::AssertMethods
#     include Asserts::Methods
#   else # :ignore
#     include AssertType::NoOpMethods
#     include Asserts::NoOpMethods
#   end
# end

# basic_assert
#
# assert_raise
#
# case Rails.configuration.assert_mode
# when :raise
#     include Asserts::ExceptionRaiser
#     include Asserts::Methods
#

# # Set assertion mode, see assert initializer
#     config.assert_mode = :ignore
#
