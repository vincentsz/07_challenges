# class Diamond
#   attr_reader :mid, :size, :sequence

#   def initialize(mid)
#     @mid = mid
#   end

#   def make
#     @sequence = ("A"..mid).to_a
#     @size = (sequence.size * 2) - 1
#     text = if size == 1
#       mid + "\n"
#     elsif size == 3
#       <<~TXT
#       #{center(sequence[0])}
#       #{center(mid + ' ' * (size - 2) + mid)}
#       #{center(sequence[0])}
#       TXT
#     else
#       half = create_half
#       <<~TXT
#       #{center(sequence[0])}
#       #{create_lines(half)}
#       #{center(mid + ' ' * (size - 2) + mid)}
#       #{create_lines(half.reverse)}
#       #{center(sequence[0])}
#       TXT
#     end
#   end

#   def create_lines(arr)
#     arr.map do |line|
#       center(line)
#     end.join("\n")
#   end

#   def center(string)
#       string.center(size)
#   end

#   def create_half
#     sequence[1..-2].map.with_index do |letter, idx|
#       letter + ' ' * ((idx * 2) + 1) + letter
#     end
#   end

#   def self.make_diamond(mid_letter)
#     diamond = Diamond.new(mid_letter).make
#   end
# end

class Diamond
  def self.make_diamond(max_letter)
    sequence = (('A'..max_letter).to_a) + (('A'...max_letter).to_a.reverse)
    size = sequence.size
    sequence.map do |letter|
      make_row(letter).center(size) + "\n"
    end.join
  end

  def self.make_row(letter)
    letter == 'A' ? 'A' : letter + ' ' * determine_spacing(letter) + letter
  end

  def self.determine_spacing(current_letter)
    (('A'..'Z').to_a.index(current_letter) * 2) - 1
  end
end

puts Diamond.make_diamond("P")