# Basic Assert

A basic, customizable assertion library for lightweight pre and post-conditions checking.

## Installation

Just add this line to your application's Gemfile:

```ruby
gem 'basic_assert'
```

## What's this for ?

Ruby misses an idiomatic, standard module for precondition and invariant checking. A precondition violation differs from other error conditions in that it's not recoverable in any meaningful way. This is in contrast with, say, errors that are part of the expected flow of execution or errors that are exceptional but recoverable.

The only thing you know when a precondition is violated is that some condition that you expected to hold true actually did not. Why such a thing happened and what consequences it will have on your program execution you generally don't know.

For this reason, assertion tools used for this purpose (like good ol' C assert) do not usually have a fixed behaviour on failure, but rather allow for customizing it in a domain, project or build specific way.

## Usage

In order to use this library you need to include an *asserter* and a *raiser* in the current `self` context.

In, say, a Rails project, you may just add an initializer like

```ruby
class Object
  # pretending an assert_mode configuration value exists ...
  case Rails.configuration.assert_mode 
  when :raise
    include BasicAssert::ExceptionRaiser
    include BasicAssert::BasicAsserter
  else # :ignore
    include BasicAssert::NoopAsserter
  end
end
```

or define your own asserting policies and side effects, or override them for the given `self` where appropriate.

Then, you may add your precondition checks accordingly:

```ruby
# plain variants:
assert condition
assert condition, message

# block variants, the asserter tells when/if the condition gets evaluated:
assert { condition block }
assert(message) { condition block } 
```

An *asserter* is a concern exposing an `assert()` function responsible of evaluating the given condition; a *raiser* is a concern exposing an `assert_raise()` function responsible of managing the actual condition failure.

Currently, the following asserters and raisers are defined:
- `BasicAsserter`: exposes plain and block versions, with or without message.
- `NoopAsserter`: does nothing, blocks are never evaluated in this case.
- `ExceptionRaiser`: raises an `AssertionException`. This extends `Exception` and hence should not be rescued by user code.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/maxjanes/basic_assert.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
