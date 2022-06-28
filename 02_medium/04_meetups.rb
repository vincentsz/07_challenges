# Meetups are a great way to meet people who share a common interest. Typically, meetups happen monthly on the same day of the week. 
# For example, a meetup's meeting may be set as:

#     The first Monday of January 2021
#     The third Tuesday of December 2020
#     The teenth wednesday of December 2020
#     The last Thursday of January 2021

# In this program, we'll construct objects that represent a meetup date. 
# Each object takes a month number (1-12) and a year (e.g., 2021). 
# Your object should be able to determine the exact date of the meeting in the specified month and year. 
# For instance, if you ask for the 2nd Wednesday of May 2021, 
# the object should be able to determine that the meetup for that month will occur on the 12th of May, 2021.

# The descriptors that may be given are strings: 'first', 'second', 'third', 'fourth', 'fifth', 'last', and 'teenth'. 
# The case of the strings is not important; that is, 'first' and 'fIrSt' are equivalent. 
# Note that "teenth" is a made up word. There was a meetup whose members realised that there are exactly 7 days that end in '-teenth'. 
# Therefore, it's guaranteed that each day of the week (Monday, Tuesday, ...) will have exactly one date that is the "teenth" of that day in every month. 
# That is, every month has exactly one "teenth" Monday, one "teenth" Tuesday, etc. 
# The fifth day of the month may not happen every month, but some meetup groups like that irregularity.

# The days of the week are given by the strings 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', and 'Sunday'. 
# Again, the case of the strings is not important.
=begin
1.Understand problem
 -input:
  constructor:
  - year(integer)
  -month(integer)
  day method
  - weekday(string)
  -schedule(string)
 -return:
 a date object(Date.civil(year, month, day that coincides with schedule))
 -output:
 -rules:
   -explicit:
    -each object takes a month number (1-12) and a year (e.g., 2021).
    -Your object should be able to determine the exact date of the meeting in the specified month and year.
    -The descriptors that may be given are strings: 'first', 'second', 'third', 'fourth', 'fifth', 'last', and 'teenth'
    -The case of the strings is not important
    -it's guaranteed that each day of the week (Monday, Tuesday, ...) will have exactly one date that is the "teenth" of that day in every month
      - teenth is 13, 14, 15, 16, 17, 18 or 19
    -The fifth day of the month may not happen every month, but some meetup groups like that irregularity
      - if tye fifth does not exist that month, return nil
    -The days of the week are given by the strings 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', and 'Sunday'. 
   -implicit:
      - a month can be 30, 31, february is 28 or 29 (leap year)
2.Examples & test cases
 -classes & methods(# & ::):
 Meetup
 #initialize(year, month)
 #day(day, schedule)
 -raised errors:
 -examples:
3.Data structure
array
Date object
4.Algorithm
 -class:
   -constructor:
   set @year
   set @month
   -instance method:
   set constant TEENTH = [13, 14, 15, 16, 17, 18, 19]
   day
        - set @day in lowercase
        - set @schedule in lowercase
        - days in month
        - each day
    days in month
        - @days in month = define how many days the given month has, set a range from 1 to last day
    each_day
        - iterate through range
        - set Date, year, month, iterator
    verify day
        - set an empty array @specified_weekdays
        - save all days that return true to monday?, tuesdsay? etc to array
    verify schedule
        -iterate through @speciefied weekdays
          - firts returns [0]
          - second [1]
          ..
          -last [-1]
          - teenth
            select the date where the day is included in array[13, 14, 15, 16, 17, 18, 19]
   -class method:
=end
require 'Date'

class Meetup
  TEENTH = [13, 14, 15, 16, 17, 18, 19]

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(day, schedule)
    @day = day.downcase
    @schedule = schedule.downcase
    create_month
    select_days
    verify_schedule
  end

  def create_month
    @days_in_month = []
    1.upto(31) do |day|
      begin
        @days_in_month << Date.civil(@year, @month, day)
      rescue Date::Error
        break
      end
    end
      # @days_in_month
  end

  def select_days
    @weekdays = []
    @days_in_month.each do |day|
      case @day
      when "monday"
        @weekdays << day if day.monday?
      when "tuesday"
        @weekdays << day if day.tuesday?
      when "wednesday"
        @weekdays << day if day.wednesday?
      when "thursday"
        @weekdays << day if day.thursday?
      when "friday"
        @weekdays << day if day.friday?
      when "saturday"
        @weekdays << day if day.saturday?
      else
        @weekdays << day if day.sunday?
      end
    end
      # @weekdays
  end

  def verify_schedule
    case @schedule
    when "first"
      @weekdays[0]
    when "second"
      @weekdays[1]
    when "third"
      @weekdays[2]
    when "fourth"
      @weekdays[3]
    when "fifth"
      @weekdays[4]
    when "last"
      @weekdays[-1]
    else
      select_teenth
    end
  end

  def select_teenth
    @weekdays.each do |weekday|
      return weekday if TEENTH.include?(weekday.day)
    end
  end
end
