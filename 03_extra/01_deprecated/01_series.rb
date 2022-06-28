# Write a program that will take a string of digits and give you all the possible consecutive number series of length n in that string.

# For example, the string "01234" has the following 3-digit series:

# - 012
# - 123
# - 234

# And the following 4-digit series:

# - 0123
# - 1234

# And if you ask for a 6-digit series from a 5-digit string, you deserve whatever you get.

=begin
1.Understand problem
 -input:
  string and integer
 -return:
 array of integers
 -output:
 -rules:
   -explicit:
   return consecutive number series o n length in that string
   raise error when n is larger than string size
   -implicit:
2.Examples & test cases
 -classes & methods(# & ::):
 -raised errors:
 -examples:
3.Data structure
4.Algorithm
 -class:
   -constructor:
   -instance method:
   -class method:
=end

class Series
  def initialize(string)
    @string = string
    @size = string.size
  end

  def slices(n)
    raise ArgumentError if n > @size

    arr = @string.chars.map(&:to_i)
    (0..@size-n).map do |idx|
      arr[idx, n]
    end
  end
end
