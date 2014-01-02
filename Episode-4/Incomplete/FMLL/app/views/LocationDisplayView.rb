class LocationDisplayView < UIView
  attr_accessor :dataSource, :latitudeLabel, :longitudeLabel

  def initWithFrame(frame)
    super
    self.backgroundColor = UIColor.blackColor
    @titleLabel = UILabel.alloc.initWithFrame(CGRectMake(20, 20, self.frame.size.width - 40, 50))
    @titleLabel.text = "Your Location"
    @titleLabel.textColor = UIColor.whiteColor
    @titleLabel.textAlignment = NSTextAlignmentCenter
    @titleLabel.font = UIFont.systemFontOfSize(36)
    self.addSubview(@titleLabel)
    self
  end

  def drawRect(rect)
    super
    if self.dataSource && self.dataSource.coordinateForLocationDisplayView(self)
      self.latitudeLabel = UILabel.alloc.initWithFrame(CGRectMake(20, 100, self.frame.size.width - 40, 30))
      self.latitudeLabel.text = self.dataSource.coordinateForLocationDisplayView(self).latitude.to_s
      self.latitudeLabel.textColor = UIColor.whiteColor
      self.latitudeLabel.textAlignment = NSTextAlignmentCenter
      self.addSubview(self.latitudeLabel)

      self.longitudeLabel = UILabel.alloc.initWithFrame(CGRectMake(20, 150, self.frame.size.width - 40, 30))
      self.longitudeLabel.text = self.dataSource.coordinateForLocationDisplayView(self).longitude.to_s
      self.longitudeLabel.textColor = UIColor.whiteColor
      self.longitudeLabel.textAlignment = NSTextAlignmentCenter
      self.addSubview(self.longitudeLabel)
    end
  end
end