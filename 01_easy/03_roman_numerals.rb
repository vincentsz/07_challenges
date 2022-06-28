# Write some code that converts modern decimal numbers into their Roman number equivalents.

# The Romans were a clever bunch. They conquered most of Europe and ruled it for hundreds of years. 
# They invented concrete and straight roads and even bikinis. 
# One thing they never discovered though was the number zero. 
# This made writing and dating extensive histories of their exploits slightly more challenging, 
# but the system of numbers they came up with is still in use today. For example the BBC uses Roman numerals to date their programmes.

# The Romans wrote numbers using letters - I, V, X, L, C, D, M. Notice that these letters have lots of straight lines 
# and are hence easy to hack into stone tablets.

#  1  => I
# 10  => X
#  7  => VII
 

# There is no need to be able to convert numbers larger than about 3000. (The Romans themselves didn't tend to go any higher)

# Wikipedia says: Modern Roman numerals ... are written by expressing each digit separately starting with the left most digit
# and skipping any digit with a value of zero.

# To see this in practice, consider the example of 1990. In Roman numerals, 1990 is MCMXC:

# 1000=M
# 900=CM
# 90=XC

# 2008 is written as MMVIII:

# 2000=MM
# 8=VIII

=begin
1.Understand problem
input: integers
output: string (roman numeral)
rules:
- impl:
- expl:
1 => I
2 => II
3 => III
4 => IV
5 => V
6 => VI
7 => VII
8 => VIII
9 => IX
10 => X
20 => XX
30 => XXX
40 => XL
50 => L
60 => LX
70 => LXX
80 => LXXX
90 => XC
100 => C

For each decimal: - 0 : ''
                  - 1, 2, 3: symbol(a) * num
                  - 4: symbol(a)symbol(b)
                  - 5: symbol(b)
                  - 6, 7, 8: symbol(b) symbol(a) * (num-5)
                  - 9: symbol(a)symbol(c)
                  
                  1-9 [I, V, X]
                  10 - 90 [X, L, C]
                  100 - 900 [C, D, M]
                  1000 - 3000 [M]
- set empty result string
- split number in seperate digits
- iterate over this collection with index
- use index to access appropriate symbol group: [[I, V, X], [X, L, C],[C, D, M], [M]]
  if 0 set to ''
  if 1 - 3 set to group[0] * num
  if 4 set to group[0]group[1]
  if 5 set to group[1]
  if 6 - 8 set to group[1](group[0]*(num-5))
  if 9 set to group[0] group[2]
  push to result
return result



2.Examples
3.Data structure
4.Algorithm
=end
ROMAN_SYMBOLS = [['I', 'V', 'X'], ['X', 'L', 'C'],['C', 'D', 'M'], ['M']]

class RomanNumeral
  attr_reader :decimal_num

  def initialize(decimal_num)
    @decimal_num = decimal_num
  end

  def to_roman
    decimal_num.digits.map.with_index do |num, idx|
    symbol_conversion(num, idx)
    end.reverse.join
  end

  def symbol_conversion(num, idx)
    case num
    when 0 
      ''
    when 1..3
      ROMAN_SYMBOLS[idx][0] * num
    when 4
      ROMAN_SYMBOLS[idx][0] + ROMAN_SYMBOLS[idx][1]
    when 5
      ROMAN_SYMBOLS[idx][1]
    when 6..8
      ROMAN_SYMBOLS[idx][1] + ROMAN_SYMBOLS[idx][0] * (num - 5)
    when 9
      ROMAN_SYMBOLS[idx][0] + ROMAN_SYMBOLS[idx][2]
    end
  end
end
