class DateField < TextField
  def init
    super

    @date_picker = UIDatePicker.new.tap do |v|
      v.minuteInterval = 5
      v.date = Time.now
      v.addTarget(self, action: 'pick_date:', forControlEvents: UIControlEventValueChanged)
    end

    self.inputView = @date_picker

    self
  end

  def pick_date(sender)
    self.text = MHPrettyDate.prettyDateFromDate(sender.date, withFormat: MHPrettyDateFormatWithTime)
  end

  def date
    @date_picker.date
  end

  def date=(date)
    @date_picker.date = date
    self.text = MHPrettyDate.prettyDateFromDate(date, withFormat: MHPrettyDateFormatWithTime)
  end
end
