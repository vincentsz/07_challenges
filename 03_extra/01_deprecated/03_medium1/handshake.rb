# Write a program that will take a decimal number, and convert it to the appropriate sequence of events for a secret handshake.

# There are 10 types of people in the world: Those who understand binary, and those who don't. 
# You and your fellow cohort of those in the "know" when it comes to binary decide to come up with a secret "handshake".

# 1 = wink
# 10 = double blink
# 100 = close your eyes
# 1000 = jump


# 10000 = Reverse the order of the operations in the secret handshake.

# handshake = SecretHandshake.new 9
# handshake.commands # => ["wink","jump"]

# handshake = SecretHandshake.new "11001"
# handshake.commands # => ["jump","wink"]

# The program should consider strings specifying an invalid binary as the  value 0.

=begin
1.Understand problem
 -input:
  string or integer
 -return: array with commands
 -output:
 -rules:
   -explicit:
      # 1 = wink
      # 10 = double blink
      # 100 = close your eyes
      # 1000 = jump
      # 10000 = Reverse the order of the operations in the secret handshake.
      # The program should consider strings specifying an invalid binary as the  value 0.
   -implicit:
2.Examples & test cases
 -classes & methods(# & ::):
 -raised errors:
 -examples:
3.Data structure
4.Algorithm
 -class:
   -constructor:
      verify if argument is integer or string
      if integer, converr to binary strin representation set to binary
      if string
        verify if all characters equal 0 or 1
        if not return []
      reverse bin array
   -instance method:
   commands
   iterate from 0 to size-2 over bin array
          if element == 1
            push corresponding command to new_arr
    if bin_arr[4] == "1"
      reverse bin_array
      
   -class method:
=end

class SecretHandshake
  COMMANDS = ['wink', 'double blink', 'close your eyes', 'jump'] 
  def initialize(value)
    @value = if value.class == Integer
              value.to_s(2)
             else
               verify_valid_string(value)
             end
    @arr = @value.chars.reverse
    @size = @arr.size
  end

  def verify_valid_string(val)
    val.chars.all? { |char| "01".include?(char) } ? val : "0"
  end

  def commands
    result = []
    (0..@size-1).each do |val|
      result << COMMANDS[val] if @arr[val] == "1" && val < 4
    end
    @arr[4] == '1' ? result.reverse : result
  end
end
