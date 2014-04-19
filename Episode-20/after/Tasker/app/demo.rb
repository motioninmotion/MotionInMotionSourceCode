class Demo
  def self.run_demo

    puts "============================================"
    puts "==== NSCalendar & NSDateComponents Demo ===="
    puts "============================================"

    calendar = NSCalendar.currentCalendar

    puts "\nWhat type of calendar?"
    puts calendar.calendarIdentifier

    puts "\nWhat timezone?"
    puts calendar.timeZone.name
    
    puts "\nGet the year, month, day, hour, minute, and second"
    components = calendar.components(
      NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit |
      NSMinuteCalendarUnit | NSSecondCalendarUnit,
      fromDate: Time.now
    )
    puts "Year:   #{components.year}"
    puts "Month:  #{components.month}"
    puts "Day:    #{components.day}"
    puts "Hour:   #{components.hour}"
    puts "Minute: #{components.minute}"
    puts "Second: #{components.second}"

    puts "\nSpecial calendar units"
    components = calendar.components(
      NSWeekCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit |
      NSQuarterCalendarUnit | NSWeekOfMonthCalendarUnit | NSWeekOfYearCalendarUnit |
      NSEraCalendarUnit,
      fromDate: Time.now
    )
    puts "Week:            #{components.week}"
    puts "Weekday:         #{components.weekday}"
    puts "Weekday Ordinal: #{components.weekdayOrdinal}"
    puts "Quarter:         #{components.quarter}"
    puts "Week of Month:   #{components.weekOfMonth}"
    puts "Week of Year:    #{components.weekOfYear}"
    puts "Era:             #{components.era}"

    puts "\nAdd components to date"
    components = NSDateComponents.new
    components.year = 10
    components.month = 1
    components.day = 5
    future = calendar.dateByAddingComponents(components, toDate: Time.now, options: 0)
    puts "Now: #{Time.now}"
    puts "Then: #{future}"

  end
end
