require 'active_support/concern'

module BasicAssert
  # ExceptionRaiser's exception
  # you'll should never rescue this in user code; indeed, ceci n'est pas un StandardError ...
  class AssertionException < Exception
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
