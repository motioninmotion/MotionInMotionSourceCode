describe "Application 'OneTweetWorld'" do
  before do
    @app = UIApplication.sharedApplication
  end

  it "displays the tweets controller" do
    @app.keyWindow.rootViewController.is_a?(TweetsViewController).should == true
  end
end
