class AppDelegate
    include CDQ

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    cdq.setup
    
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @tabController = UITabBarController.new

    @postsNavController = UINavigationController.alloc.initWithRootViewController(PostsController.new)
    @pseudonymNavController = UINavigationController.alloc.initWithRootViewController(PseudonymController.new)

    @tabController.viewControllers = [@postsNavController, @pseudonymNavController]

    @window.rootViewController = @tabController
    @window.makeKeyAndVisible
    true
  end
end
