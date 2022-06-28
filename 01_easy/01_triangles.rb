# Write a program to determine whether a triangle is equilateral, isosceles, or scalene.
# An equilateral triangle has all three sides the same length.
# An isosceles triangle has exactly two sides of the same length.
# A scalene triangle has all sides of different lengths.
# Note: For a shape to be a triangle at all, all sides must be of length > 0, 
# and the sum of the lengths of any two sides must be greater than the length of the third side.

=begin
1.Understand problem
input: 3 numbers (integer or float)
output : string or raised error:('equilateral', 'isosceles', 'scalene')
rules:
  -explicit:
    - all triangles have three sides
    - each side is greater than length 0
    - the sum of any two sides must be greater than the other side
      - the sum of the smallest two sides must be greater than the biggest?
    - equilateral: three sides of same length
    - isosceles: exactly two sides of the same length
    - scalene: all sides different lengths
  -implicit:

2.Examples
Triangle.new(2, 2, 2).kind == 'equilateral'
Triangle.new(3, 4, 4).kind == 'isosceles'
Triangle.new(4, 3, 4).kind == 'isosceles'
Triangle.new(10, 10, 2).kind == 'isosceles'
Triangle.new(3, 3, 5).kind == 'scalene'
Triangle.new(5, 4, 2).kind == 'scalene'
Triangle.new(0.4, 0.6, 0.3).kind == 'scalene'
Triangle.new(0, 0, 0).kind => ArgumentError
Triangle.new(3, 4, -5).kind => ArgumentError
Triangle.new(1, 1, 3).kind => ArgumentError
Triangle.new(1, 1, 2).kind => ArgumentError


3.Data structure
array
4.Algorithm
- set collection (array) to three lengths
- raise error if any side <= 0
- sort array form small to big
- raise error if sum of first two sides is smaller than third side
- return equilateral if size of unique elements is one
- return isoscles if size of unique elements is tqo
- otherwise return scalene
=end

class Triangle
  attr_reader :sides
  def initialize(a, b, c)
    @sides = [a, b, c].sort
    illegal_input?
  end

  def illegal_input?
    if under_zero?
      raise ArgumentError, 'At least one side is invalid!'
    elsif sum_smaller?
      raise ArgumentError, 'Sum of two sides is smaller or equal than other!'
    end
  end

  def under_zero?
    sides.any?{ |side| side <= 0 }
  end

  def sum_smaller?
    sides[0,2].sum <= sides[-1]
  end
  
  def kind
    if equilateral?
      'equilateral'
    elsif isosceles?
      'isosceles'
    else
      'scalene'
    end
  end

  def equilateral?
    sides.uniq.size == 1
  end

  def isosceles?
    sides.uniq.size == 2
  end
end
