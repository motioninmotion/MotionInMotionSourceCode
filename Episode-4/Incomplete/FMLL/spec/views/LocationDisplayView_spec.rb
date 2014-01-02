class MockDataSourceWithData
  def coordinateForLocationDisplayView(locationDisplayView)
    CLLocationCoordinate2DMake(123.123, 321.321)
  end
end

describe LocationDisplayView do
  before do
    @display = LocationDisplayView.alloc.initWithFrame(CGRectZero)
  end

  it "can have a data source" do
    dataSource = Object.new
    @display.dataSource = dataSource
    @display.dataSource.should === dataSource
  end

  describe "data source has data" do
    before do
      @display.dataSource = MockDataSourceWithData.new
      @display.drawRect(CGRectZero)
    end

    it "displays the latitude" do
      @display.latitudeLabel.text.should == "123.123"
    end

    it "displays the longitude" do
      @display.longitudeLabel.text.should == "321.321"
    end
  end
end