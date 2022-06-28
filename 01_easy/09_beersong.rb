class BeerSong
  def self.verse(num)
    if num > 1
      text = <<~TXT
      #{bottle_s(num)} of beer on the wall, #{bottle_s(num)} of beer.
      Take one down and pass it around, #{bottle_s(num - 1)} of beer on the wall.
      TXT
    elsif num == 1
      text = <<~TXT
      #{bottle_s(num)} of beer on the wall, #{bottle_s(num)} of beer.
      Take it down and pass it around, no more bottles of beer on the wall.
      TXT
    else
      text = <<~TXT
      No more bottles of beer on the wall, no more bottles of beer.
      Go to the store and buy some more, 99 bottles of beer on the wall.
      TXT
    end
  end

  def self.bottle_s(num)
    "#{num} bottle#{num == 1 ? '' : 's'}"
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
