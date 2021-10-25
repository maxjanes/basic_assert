require 'basic_assert'

class ExceptionallyAssertive
  include BasicAssert::ExceptionRaiser
  include BasicAssert::BasicAsserter
end
