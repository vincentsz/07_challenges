class DNA
  def initialize(sequence1)
    @sequence1 = sequence1
  end

  def hamming_distance(sequence2)
    short, long = [@sequence1, sequence2].sort_by(&:size)
    (0...short.size).count{ |idx| short[idx] != long[idx] }
  end
end