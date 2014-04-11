class DueAtLabel < UILabel
  def init
    super
    self.font = UIFont.fontWithName("HelveticaNeue-Light", size: 11)
    self.textColor = UIColor.colorWithRed(102/255, green: 102/255, blue: 102/255, alpha: 1)
    self
  end

  def configure(data = {})
    if data[:due_at]
      self.text = data[:due_at]
    else
      self.text = ""
    end
  end
end