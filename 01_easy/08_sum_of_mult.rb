# Write a program that, given a natural number and a set of one or more other numbers, 
# can find the sum of all the multiples of the numbers in the set that are less than the first number. 
# If the set of numbers is not given, use a default set of 3 and 5.

# For instance, if we list all the natural numbers up to, but not including, 
# 20 that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.

=begin
1.Understand problem
input:
- a natural number( pos integer)
- an (optional) set of one or more numbers(pos integers)
output
- integer: sum of all the multiples in the set that are less than the first num
rules:
implicit
all input are pos integers
explicit
if no set is given use a default set of 3 and 5
output is sum of all the multiples in the set that are less than the first num

2.Examples
3.Data structure
integer
range
array
4.Algorithm
- assign a variable set to a given set, if none is given set to a [3, 5] collection
- create an empty array result
- create range 1 to given number - 1
- iterate over range
  - iterate over set
    - calculate modulus: range_iteration % set_iteration
    - if result equals 0 and range_iteration is not in result, save  range iteration to result
    end iteration
  end iteration
- calculate sum of result array
-return sum
5.class struct
  initialize: @set splat operator (default = [3, 5])
  to has the natural num as arg
=end

class SumOfMultiples
  attr_reader :set

  def initialize(*set)
    @set = set.empty? ? [3, 5] : set
  end

  def self.to(num)
    new.to(num)
  end

  def to(num)
    (1...num).select do |number|
      is_a_multiple?(number)
    end.sum
  end

  def is_a_multiple?(number)
    set.any?{ |div| (number % div).zero? }
  end
end
