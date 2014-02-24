class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = HomeController.new
    @window.makeKeyAndVisible

    true
  end

  def application(application, openURL:url, sourceApplication:sourceApplication, annotation:annotation)
    params = Hash[url.query.split(/[&=]/).each_slice(2).to_a]

    auth = {
      return_url_scheme: url.host,
      return_url_path: url.path,
      app_id: params["app_id"],
      access_rights: params["access_rights"]
    }

    @window.rootViewController.presentViewController(
      UINavigationController.alloc.initWithRootViewController(
        AuthController.alloc.initWithAuth(auth)
      ),
      animated: true, completion: nil)

    true
  end
end
