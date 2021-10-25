require 'active_support/concern'

module BasicAssert
  class AssertionException < Exception
    # yeah, ceci n'est pas un StandardError ...
  end

  module ExceptionRaiser
    extend ActiveSupport::Concern

    included do
      def assert_raise(message)
        raise AssertionException, message || caller_locations(2..2)
      end
    end
  end
end
