require 'basic_assert'

class QuietlyAssertive
  include BasicAssert::NoopAsserter
end
