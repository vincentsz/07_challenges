# Write a program that will take a string of digits and return all the possible consecutive number series of a specified length in that string.

# For example, the string "01234" has the following 3-digit series:

#     012
#     123
#     234

# Likewise, here are the 4-digit series:

#     0123
#     1234

# Finally, if you ask for a 6-digit series from a 5-digit string, you should throw an error.
=begin
1.Understand problem
input: string representation of series of integers, length
output: an array
rules:
OOP:
- Series class
- slice instance method with integer argument
-Problem:
explicit
- output is a nested array, containg consecutive series of specified length
- if length is bigger than arry size ArgumentError should be returned
implicit:
- input string is always a valid input
2.Examples
series = Series.new("01234")
sseries.slice(3) == [[0, 1, 2], [1, 2, 3], [2, 3, 4]]
3.Data structure
string
integer
array
4.Algorithm
Create a series class
definie constructor with one ivar @sequence
define an instance method with one parameter num
iterate from 0 to nu positions from end
create on each variation an array that starts at index and has num length

=end
class Series
  attr_reader :sequence, :size

  def initialize(sequence)
    @sequence = sequence.chars.map(&:to_i)
    @size = sequence.size
  end

  def slices(length)
    raise ArgumentError if length > size
    (0..size - length).map do |idx|
      sequence[idx, length]
    end   
  end
end