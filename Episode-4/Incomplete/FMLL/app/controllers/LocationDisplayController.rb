class LocationDisplayController < UIViewController
  attr_accessor :display, :coordinate

  def viewDidLoad
    self.display = LocationDisplayView.alloc.initWithFrame(self.view.frame)
    self.display.dataSource = self
    self.view.addSubview(self.display)
    BW::Location.get_once do |result|
      if result.is_a?(CLLocation)
        self.coordinate = result.coordinate
        self.display.setNeedsDisplay
      end
    end
  end

  # Location Display View Data Source

  def coordinateForLocationDisplayView(locationDisplayView)
    self.coordinate
  end
end