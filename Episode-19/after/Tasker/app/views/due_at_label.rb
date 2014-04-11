class DueAtLabel < UILabel
  def init
    super
    self.font = UIFont.fontWithName("HelveticaNeue-Light", size: 11)
    self
  end

  def configure(data = {})
    if data[:due_at]
      self.text = "Due " + MHPrettyDate.prettyDateFromDate(data[:due_at], withFormat: MHPrettyDateFormatWithTime)
      if MHPrettyDate.isPastTime(data[:due_at])
        self.textColor = UIColor.redColor
      else
        self.textColor = UIColor.colorWithRed(102/255, green: 102/255, blue: 102/255, alpha: 1)
      end
    else
      self.text = ""
    end
  end
end
