# NumberInWords

It is not realistic to expect a single maintainer to be sufficiently
polyglottous to be able to manage a system for writing numbers as words in a
variety of languages. Furthermore, the rules in various languages vary to such
an extent that there is little use in attempting to impose a single framework
(beyond a collection of utilities).

This gem provides a central point into which locale-specific number-to-word gems
can hook.

## Installation

The gems for the locales you support should depend on this gem, so under normal
circumstances once you've installed those, this is installed also. For example,
if you add

    gem 'number_in_words_fr'

to your Gemfile, you'll have this gem too.

## Usage

    require 'number_in_words/core_ext'

    I18n.locale = :fr
    123.to_words  # => "cent vingt-trois"

If you don't want to monkey-patch Integer, you can do this instead:

    I18n.locale = :fr
    NumberInWords.int_to_words 123  # => "cent vingt-trois"

'number_in_words/core_ext' isn't "require"d by default

## available locales

    gem 'number_in_words_fr'  # French
    gem 'number_in_words_en'  # English (using short-scale billions)


## Contributing

### There are two ways to contribute - firstly the usual:

1. Fork it ( http://github.com/<my-github-username>/number_in_words/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

### secondly

1. if you want to contribute a locale, make your own gem that plugs into this thus:

    class RussianNumberInWords
      def int_to_words i, options={}
        # ur code here
      end
    end

    NumberInWords.add_handler :ru, RussianNumberInWords.new

2. publish the gem
3. let me know and I'll add a link here
