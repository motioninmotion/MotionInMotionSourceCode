module BubbleWrap
  module Location
    module_function

    def get_once(&block)
      @block = block
    end

    def locationManager(locationManager, didUpdateToLocation: to, fromLocation: from)
      @block.call(to)
    end
  end
end

describe LocationDisplayController do
  tests LocationDisplayController

  it "uses the LocationDisplayView" do
    controller.view.subviews[0].is_a?(LocationDisplayView).should == true
  end

  it "sets itself to be the display's data source" do
    controller.display.dataSource.should === controller
  end

  describe ".coordinateForLocationDisplayView:" do
    it "returns the loaded coordinate" do
      controller.coordinate = CLLocationCoordinate2DMake(123.123, 321.321)
      controller.coordinateForLocationDisplayView(controller.display).should == controller.coordinate
    end
  end

  describe "loading the location" do
    it "loads the user's coordinate" do
      controller.coordinate = nil
      locationManager = BW::Location.instance_variable_get("@location_manager")
      to = CLLocation.alloc.initWithLatitude(123.123, longitude: 321.321)
      from = CLLocation.alloc.initWithLatitude(0.0, longitude: 0.0)
      BubbleWrap::Location.locationManager(locationManager, didUpdateToLocation: to, fromLocation: from)
      controller.coordinate.should == CLLocationCoordinate2DMake(123.123, 321.321)
    end
  end

end