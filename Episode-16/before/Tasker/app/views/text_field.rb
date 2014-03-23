class TextField < UITextField
  def textRectForBounds(bounds)
    CGRectInset(bounds, 10, 10)
  end

  def placeholderRectForBounds(bounds)
    textRectForBounds(bounds)
  end

  def editingRectForBounds(bounds)
    textRectForBounds(bounds)
  end
end