class Verse
  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

  def one_verse
    if amount > 1
      <<~TXT
      #{standard_phrase}
      Take one down and pass it around, #{bottle_s(amount - 1)} of beer on the wall.
      TXT
    elsif amount == 1
      <<~TXT
      #{standard_phrase}
      Take it down and pass it around, no more bottles of beer on the wall.
      TXT
    else
      <<~TXT
      No more bottles of beer on the wall, no more bottles of beer.
      Go to the store and buy some more, 99 bottles of beer on the wall.
      TXT
    end
  end

  private

  def standard_phrase
    "#{bottle_s(amount)} of beer on the wall, #{bottle_s(amount)} of beer."
  end

  def bottle_s(num)
    "#{num} bottle#{num == 1 ? '' : 's'}"
  end
end

class BeerSong
  def self.verse(num)
    Verse.new(num).one_verse
  end

  def self.verses(high_num, low_num)
    (low_num..high_num).to_a.reverse.map do |num|
      verse(num)
    end.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end
end
