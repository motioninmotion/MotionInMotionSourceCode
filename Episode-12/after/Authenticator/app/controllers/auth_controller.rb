class AuthController < UIViewController
  attr_accessor :auth

  def initWithAuth(auth)
    self.init
    self.auth = auth
    self.title = "Authenticate"
    self
  end

  def loadView
    self.view = UIScrollView.new
  end

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.whiteColor

    self.view.addSubview(UILabel.new.tap { |l| 
      l.frame = [[20, 40], [280, 30]]
      l.font = UIFont.boldSystemFontOfSize(18)
      l.text = "Log In To This App"
      l.textAlignment = NSTextAlignmentCenter
    })

    self.view.addSubview(UILabel.new.tap { |l| 
      l.frame = [[20, 80], [280, 30]]
      l.text = "This app wants acess to your:"
      l.textAlignment = NSTextAlignmentCenter
    })

    self.view.addSubview(UILabel.new.tap { |l| 
      l.frame = [[20, 120], [280, 30]]
      l.text = self.auth[:access_rights].gsub('_', ', ')
      l.textAlignment = NSTextAlignmentCenter
    })

    self.view.addSubview(UIButton.new.tap { |b|
      b.frame = [[20, 200], [280, 50]]
      b.setTitle("Approve Login", forState: UIControlStateNormal)
      b.setTitleColor(UIColor.blueColor, forState: UIControlStateNormal)
      b.addTarget(self, action: 'button_pressed:', forControlEvents: UIControlEventTouchUpInside)
    })
  end

  def button_pressed(sender)
    self.presentingViewController.dismissViewControllerAnimated(true, completion:nil)
    UIApplication.sharedApplication.openURL(
      NSURL.URLWithString("#{self.auth[:return_url_scheme]}://tv.motioninmotion.Authenticator/#{self.auth[:return_url_path]}?key=123")
    )
  end
end