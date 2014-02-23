class HomeController < UIViewController
  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.whiteColor

    self.view.addSubview(UILabel.new.tap { |l|
      l.frame = [[20, 40], [280, 50]]
      l.text = "Use me to login"
      l.textAlignment = NSTextAlignmentCenter
    })

    self.view.addSubview(UIButton.new.tap { |b|
      b.frame = [[20, 200], [280, 50]]
      b.setTitle("Dummy Login", forState: UIControlStateNormal)
      b.setTitleColor(UIColor.blueColor, forState: UIControlStateNormal)
      b.addTarget(self, action: 'button_pressed:', forControlEvents: UIControlEventTouchUpInside)
    })
  end

  def button_pressed(sender)
    auth = {
      return_url_scheme: 'fakehost',
      return_url_path: 'fakepath',
      app_id: '123',
      access_rights: 'Images_Posts_UserInfo'
    }

    self.presentViewController(
      UINavigationController.alloc.initWithRootViewController(
        AuthController.alloc.initWithAuth(auth)
      ),
      animated: true, completion: nil)
  end
end