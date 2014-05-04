class NameLabel < UILabel
  def init
    super
    self.font = UIFont.fontWithName("HelveticaNeue-Medium", size: 15)
    self.textColor = UIColor.colorWithRed(51 / 255, green: 51 / 255, blue: 51 / 255, alpha: 1)
    self.numberOfLines = 0
    self
  end

  def configure(data = {})
    if data[:name]
      attributed_text = NSMutableAttributedString.alloc.initWithString(data[:name])
      if data[:complete]
        attributed_text.addAttribute(NSStrikethroughStyleAttributeName, value: 2, range: NSMakeRange(0, attributed_text.length))
      end
      self.attributedText = attributed_text
    else
      self.text = ""
    end
  end
end