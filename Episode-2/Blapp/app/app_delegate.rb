class AppDelegate

  attr_accessor :postsModel

  def application(application, didFinishLaunchingWithOptions:launchOptions)

    self.postsModel = Post.new

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    postsController = PostsController.new
    postsNavigationController = UINavigationController.alloc.initWithRootViewController(postsController)

    createPostController = CreatePostController.new
    
    tabController = UITabBarController.new
    tabController.viewControllers = [postsNavigationController, createPostController]
    @window.rootViewController = tabController

    @window.makeKeyAndVisible

    true
  end
end
