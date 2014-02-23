class HomeController < UIViewController
  def viewDidLoad
    super
    self.view.backgroundColor = UIColor.whiteColor

    self.view.addSubview(UIButton.new.tap { |b|
      b.frame = [[20, 40], [280, 50]]
      b.setTitle("Log Me In", forState: UIControlStateNormal)
      b.setTitleColor(UIColor.blueColor, forState: UIControlStateNormal)
      b.addTarget(self, action: 'button_pressed:', forControlEvents: UIControlEventTouchUpInside)
    })
  end

  def button_pressed(sender)
    puts "Open Authenticator Here"
  end
end