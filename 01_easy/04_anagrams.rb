class Anagram
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def match(word_list)
    word_list.select do |option|
      sort_word(word) == sort_word(option) && word != option.downcase
    end
  end

  def sort_word(wrd) 
    wrd.downcase.chars.sort
  end
end