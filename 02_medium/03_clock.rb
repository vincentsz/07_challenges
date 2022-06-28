# Create a clock that is independent of date.

# You should be able to add minutes to and subtract minutes from the time represented by a given clock object. 
# Two clock objects that represent the same time should be equal to each other.

# You may not use any built-in date or time functionality; just use arithmetic operations.

=begin
1.Understand problem
 -input:
  integers: hours and/or minutes
 -return:
 -output:
  string representation of time "XX:XX"
 -rules:
   -explicit:
    # You should be able to add minutes to and subtract minutes from the time represented by a given clock object. 
    # Two clock objects that represent the same time should be equal to each other.
    # You may not use any built-in date or time functionality; just use arithmetic operations.
   -implicit:
    - a day has 24 hours wich is 24 * 60 minutes (1440)
    - one minute befor midnight is "23:59" == 1439
      1439.divmod(60) == [23, 59]
    - midnight is "00:00" == 1440
      1440.divmod(60) = [24, 0]
     -one minute after midnight is "00:01" == 1
     1.divmod(60) == [0, 1]
2.Examples & test cases
 -classes & methods(# & ::):
 class: Clock
 #: at, +, -
 -raised errors:
 -examples:
3.Data structure
Integers
Strings
4.Algorithm
 -class: Clock
   -constructor:
   -instance method:
   at(hours, minutes = 0)
    set a variable total_minutes: (hours * 60 + minutes) % 1440
    display(total)
  display(total)
    hours, minutes = total.divmod(60)
    "format hours: format minutes"
  -
    result = calculate modulo: input % 1440
    total_minutes - result
    if negative subtract from 1440
  +
      result = calculate modulo: input % 1440
    total_minutes + result
    calculate modul0
   -class method:
=end

# class Clock
#   ONE_HOUR = 60
#   ONE_DAY = 1440

#   def self.at(hours, minutes = 0)
#     hours = 24 if hours == 0
#     @@total_minutes = ((hours * ONE_HOUR) + minutes)
#     self
#   end

#   def self.+(minutes)
#     add = minutes % ONE_DAY
#     @@total_minutes += add
#     @@total_minutes %= ONE_DAY
#     # result >= 0 ? result : ONE_DAY - result
#     self 
#   end


#   def self.-(minutes)
#     subtract = minutes % ONE_DAY
#     @@total_minutes -= subtract
#     # result >= 0 ? result : ONE_DAY - result
#     self 
#   end

#   def self.to_s
#     hour, minute = @@total_minutes.divmod(60)
#     "#{format("%02d", hour)}:#{format("%02d", minute)}"
#   end
# end

class Clock
  ONE_HOUR = 60
  ONE_DAY = 1440
  attr_reader :total_minutes

  def initialize(total_minutes)
    @total_minutes = total_minutes
  end

  def self.at(hours, minutes = 0)
    hours = (ONE_DAY / ONE_HOUR) if hours == 0
    total_minutes = (hours * ONE_HOUR) + minutes
    Clock.new(total_minutes)
  end

  def +(minutes)
    @total_minutes += (minutes % ONE_DAY)
    @total_minutes %= ONE_DAY
    self 
  end

  def -(minutes)
    @total_minutes -= (minutes % ONE_DAY)
    self 
  end

  def to_s
    hour, minute = @total_minutes.divmod(60)
    "#{format("%02d", hour)}:#{format("%02d", minute)}"
  end

  def ==(other)
    total_minutes == other.total_minutes
  end
end


# p Clock.at(0)
