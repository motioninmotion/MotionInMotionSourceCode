class TextField < UITextField
  def init
    super

    self.layer.borderWidth = 1
    self.layer.borderColor = UIColor.grayColor.CGColor
    self.layer.cornerRadius = 3

    self
  end

  def textRectForBounds(bounds)
    CGRectMake(bounds.origin.x + 10, bounds.origin.y, bounds.size.width - 10, bounds.size.height)
  end

  def placeholderRectForBounds(bounds)
    textRectForBounds(bounds)
  end

  def editingRectForBounds(bounds)
    textRectForBounds(bounds)
  end
end
