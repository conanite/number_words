require 'number_words'

class Integer
  def to_words
    NumberWords.int_to_words self
  end
end
