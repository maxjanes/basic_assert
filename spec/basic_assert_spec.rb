require 'support/exceptionally_assertive'
require 'support/quietly_assertive'

RSpec.describe BasicAssert do
  let(:some_message) { 'woooh!' }
  let(:some_object) { double }
  let(:exceptionally_assertive) { ExceptionallyAssertive.new }
  let(:quietly_assertive) { QuietlyAssertive.new }

  it 'has a version number' do
    expect(BasicAssert::VERSION).not_to be nil
  end

  it 'asserts a plain condition' do
    expect { exceptionally_assertive.assert true }.not_to raise_error
    expect { exceptionally_assertive.assert false }.to raise_error BasicAssert::AssertionException
    expect { exceptionally_assertive.assert { true } }.not_to raise_error
    expect { exceptionally_assertive.assert { false } }.to raise_error BasicAssert::AssertionException
  end

  it 'asserts a condition with message' do
    expect { exceptionally_assertive.assert true, some_message }.not_to raise_error
    expect { exceptionally_assertive.assert false, some_message }.to raise_error BasicAssert::AssertionException, some_message
    expect { exceptionally_assertive.assert(some_message) { true } }.not_to raise_error
    expect { exceptionally_assertive.assert(some_message) { false } }.to raise_error BasicAssert::AssertionException, some_message
  end

  it 'does not invoke a block with a noop asserter' do
    expect(some_object).not_to receive(:side_effect)
    quietly_assertive.assert { some_object.side_effect }
  end

end
