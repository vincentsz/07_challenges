# The Greek mathematician Nicomachus devised a classification scheme for natural numbers (1, 2, 3, ...), 
# identifying each as belonging uniquely to the categories of abundant, 
# perfect, or deficient based on a comparison between the number and the sum of its positive divisors 
# (the numbers that can be evenly divided into the target number with no remainder, excluding the number itself). 
# For instance, the positive divisors of 15 are 1, 3, and 5. This sum is known as the Aliquot sum.

#     Perfect numbers have an Aliquot sum that is equal to the original number.
#     Abundant numbers have an Aliquot sum that is greater than the original number.
#     Deficient numbers have an Aliquot sum that is less than the original number.

# Examples:

#     6 is a perfect number since its divisors are 1, 2, and 3, and 1 + 2 + 3 = 6.
#     28 is a perfect number since its divisors are 1, 2, 4, 7, and 14 and 1 + 2 + 4 + 7 + 14 = 28.
#     15 is a deficient number since its divisors are 1, 3, and 5 and 1 + 3 + 5 = 9 which is less than 15.
#     24 is an abundant number since its divisors are 1, 2, 3, 4, 6, 8, and 12 and 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36 which is greater than 24.
#     Prime numbers 7, 13, etc. are always deficient since their only divisor is 1.

# Write a program that can tell whether a number is perfect, abundant, or deficient.
=begin
1.Understand problem
input: pos integer
output: string: 'perfect', 'abundant', 'deficient'
rules: 
-implicit:
  input is always an integer
  return error if input is neg
- explicit
  - the aliquot sum is the sum of its pos divisors, excluding the num itself
  - a pos divisor is a number that has no remainder when used for dividing original num
  - 'perfect' == aliquot sum equals num
  - 'abundant' == aliquot sum biiger than num
  - 'deficient' == aliquot sum smaller than num
2.Examples
6 == 'perfect
28 == 'perfect'
15 ==  'deficient
24 == 'abundant
7 == deficient
13 == defiecient
3.Data structure
integer
array
string
4.Algorithm
return error if num < 1
Create a constant with three output results
Creat an a range from 1 to input number - 1
Iterate through range
Calculate modulus orig num div by current num
select numbers where result is 0
calculate sum of selection
if the sum equals num return 'perfect
  if bigger return abundant
    if smaller return deficient
=end
CLASSIFICATION = ['perfect', 'abundant', 'deficient']

class PerfectNumber
  def self.classify(num)
    raise StandardError if num < 1

    case calculate_aliquot(num) <=> num
    when 0 then CLASSIFICATION[0]
    when 1 then CLASSIFICATION[1]
    else        CLASSIFICATION[2]
    end
  end
  
  class << self
    private

    def calculate_aliquot(num)
      (1..Math.sqrt(num)).each_with_object([]) do |div, coll|
        next unless num % div == 0
        pos_div_1 = div
        pos_div_2 = num / pos_div_1
        coll << pos_div_1
        coll << pos_div_2 unless [num, pos_div_1].include?(pos_div_2) 
      end.sum
    end

  end
end
