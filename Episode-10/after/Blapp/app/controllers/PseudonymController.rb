class PseudonymController < UIViewController
  attr_accessor :pseudonym

  def init
    super
    self.title = "Profile"
    self.tabBarItem = UITabBarItem.alloc.initWithTitle("Profile", image:UIImage.imageNamed("Profile"), tag:1)
    self.pseudonym = Pseudonym.first || Pseudonym.create
    cdq.save
    self
  end

  def viewDidLoad
   self.navigationController.navigationBar.translucent = false

   self.navigationItem.rightBarButtonItem = saveButton

    self.view.backgroundColor = UIColor.whiteColor
    @pseudonymView = PseudonymView.alloc.initWithFrame(self.view.frame, andPseudonym:self.pseudonym)
    self.view.addSubview(@pseudonymView)
  end

  def saveButton
    @saveButton ||= UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemSave, target:self, action:'save')
  end

  def save
    @pseudonymView.subviews.each { |v| v.resignFirstResponder }
    self.pseudonym.name = @pseudonymView.nameField.text
    self.pseudonym.bio = @pseudonymView.bioField.text
    cdq.save
    UIAlertView.alloc.initWithTitle("Profile Updated", message:nil, delegate:nil, cancelButtonTitle:"OK", otherButtonTitles:nil).show
  end

end
