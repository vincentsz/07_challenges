SCORES = {
['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'] => 1,
['D', 'G'] => 2,
['B', 'C', 'M', 'P'] => 3,
['F', 'H', 'V', 'W', 'Y'] => 4,
['K'] => 5,
['J', 'X'] => 8,
['Q', 'Z'] =>	10
}

class Scrabble
  attr_reader :word

  def initialize(wrd)
    @word = wrd ? wrd.upcase : ''
  end

  def score
    SCORES.map do |arr_chars, score|
      word.chars.count { |char| arr_chars.include?(char) } * score
    end.sum
  end

  def self.score(word)
    self.new(word).score
  end
end


