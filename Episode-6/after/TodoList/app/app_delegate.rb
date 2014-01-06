class AppDelegate
  attr_accessor :todoListController

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    self.todoListController = TodoListController.new

    navController = UINavigationController.alloc.initWithRootViewController(self.todoListController)
    @window.rootViewController = navController

    @window.makeKeyAndVisible
    true
  end
end
