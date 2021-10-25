require 'active_support/concern'

module BasicAssert
  module NoopAsserter
    extend ActiveSupport::Concern

    included do
      def assert(*args)
        # do nothing
      end
    end
  end
end
