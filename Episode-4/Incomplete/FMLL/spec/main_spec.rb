describe "Application 'FMLL'" do
  before do
    @app = UIApplication.sharedApplication
  end

  it "uses a LocationDisplayController as it's root view controller" do
    @app.keyWindow.rootViewController.is_a?(LocationDisplayController).should == true
  end
end
