require 'Date'

class Meetup
  TEENTH = [13, 14, 15, 16, 17, 18, 19]
  SCHEDULE = {
    "first" => 0,
    "second" => 1,
    "third" => 2,
    "fourth" => 3,
    "fifth" => 4,
    "last" => -1
  }

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

  private

  def create_month
    @days_in_month = (1..Date.civil(@year, @month, -1).day).to_a
  end

  def select_days
    @weekdays = @days_in_month.select do |weekday|
      Date.civil(@year, @month, weekday).send(@day + "?")
    end
  end

  def verify_schedule
    num = if SCHEDULE.include?(@schedule)
            @weekdays[SCHEDULE[@schedule]]
          else
            select_teenth
          end
    num ? Date.civil(@year, @month, num) : num
  end

  def select_teenth
    @weekdays.each do |weekday|
      return weekday if TEENTH.include?(weekday)
    end
  end
end
