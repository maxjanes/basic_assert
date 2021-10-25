require 'active_support/concern'

module BasicAssert
  module BasicAsserter
    extend ActiveSupport::Concern

    included do
      # check a pre/post-condition, used as:
      # - assert condition
      # - assert condition, message
      # - assert { condition }
      # - assert(message) { condition }
      def assert(*args)
        if block_given?
          assert yield, args[0]
        elsif !args[0]
          assert_raise args[1]
        end
      end
    end
  end
end
