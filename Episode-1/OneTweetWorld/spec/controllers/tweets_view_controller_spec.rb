describe "TweetsViewController" do
  tests TweetsViewController

  describe ".userTweet" do

    it "is displayed" do
      view('User Tweet').is_a?(UITextView).should == true
    end

    it "can not be edited" do
      view('User Tweet').isEditable.should == false
    end

  end

  describe ".toolbar" do

    it "is displayed" do
      view('Toolbar').is_a?(UIToolbar).should == true
    end

    it "displays the next tweet button" do
      view('Toolbar').items[0].title.should == 'Next Tweet'
    end

  end

  describe ".userImage" do

    it "is displayed" do
      view('User Image').is_a?(UIImageView).should == true
    end

  end

  describe ".userName" do

    it "is displayed" do
      view('User Name').is_a?(UILabel).should == true
    end

  end

  describe ".userBio" do

    it "is displayed" do
      view('User Bio').is_a?(UILabel).should == true
    end

  end

end