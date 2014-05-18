class Label < UILabel
  def init
    super

    self.font = UIFont.boldSystemFontOfSize(14)
    self.textColor = UIColor.darkGrayColor

    self
  end
end
