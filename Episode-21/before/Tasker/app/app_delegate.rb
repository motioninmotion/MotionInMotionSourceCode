class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    application.applicationIconBadgeNumber = 0

    RemoteManager.setup

    UINavigationBar.appearance.tap do |o|
      o.barTintColor = UIColor.purpleColor
      o.tintColor = UIColor.whiteColor

      o.setTitleTextAttributes({
        UITextAttributeTextColor => UIColor.whiteColor
      })
    end

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(TaskListController.new)
    @window.makeKeyAndVisible

    LoadTasksCommand.run

    true
  end

  def applicationDidBecomeActive(application)
    application.applicationIconBadgeNumber = 0
  end

  def application(application, didReceiveLocalNotification: notification)
    if application.applicationState == UIApplicationStateActive
      application.applicationIconBadgeNumber = 0
      UIAlertView.new.tap { |a|
        a.title = notification.alertBody
        a.addButtonWithTitle('OK')
      }.show
    end
  end
end
