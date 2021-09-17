# da-has_token

A token generator for Ruby on Rails 3 and Active Record.

## Installation

Put the following gem requirement in your `Gemfile`:

    gem "da-has_token"

## Usage

Make sure your model has a field called `token` (type string).

```ruby
class Entry < ActiveRecord::Base  
  # Use default options (size 10, chars a-z + A-Z + 0-9)
  has_token
  
  # Use custom token size
  # has_token size: 25
  
  # Use custom set of characters
  # has_token chars: "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
end
```

The token is set in a `before_create` callback. There is a possible race condition when checking if a newly generated token already exists – make sure to add an unique index to the `token` column in the database.

A `NoMoreTokens` error is raised if a new unique token can not be generated within [`HasToken::TokenGenerator::MAX_TRIES`](https://github.com/die-antwort/da-has_token/blob/master/lib/da-has_token/token_generator.rb#L4).

There are similar plugins providing more features configuration options, e.g. https://github.com/mindbox/has_token.

This project is released under the MIT license.
