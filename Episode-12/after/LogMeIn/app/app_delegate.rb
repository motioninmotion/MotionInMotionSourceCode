class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = HomeController.new
    @window.makeKeyAndVisible

    true
  end

  def application(application, openURL:url, sourceApplication:sourceApplication, annotation:annotation)
    params = Hash[url.query.split(/[&=]/).each_slice(2).to_a]

    puts url.host
    puts url.path
    puts params["key"]
    true
  end

end
