require "number_words/version"

module NumberWords
  @@handlers = { }

  def self.int_to_words int, options={ }
    @@handlers[I18n.locale.to_sym].int_to_words(int.to_i, options).strip
  end

  def self.add_handler locale, handler
    @@handlers[locale] = handler
  end

  class Base
    def split_by_thousands n
      sub = [n % 1000]
      sup = n / 1000
      sub + (sup > 0 ? split_by_thousands(sup) : [])
    end
  end

end
