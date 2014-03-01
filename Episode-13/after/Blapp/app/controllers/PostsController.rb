class PostsController < UITableViewController
  include PostsControllerTableViewDataSource
  include PostsControllerTableViewDelegate
  include PostsControllerAlertViewDelegate

  def init
    super
    self.title = "Posts"
    self.tabBarItem = UITabBarItem.alloc.initWithTitle("Posts", image:UIImage.imageNamed("Newspaper"), tag:0)
    self
  end

  def viewDidLoad
    super

    NSNotificationCenter.defaultCenter.addObserver(self,
                                          selector:'font_changed:',
                                              name:UIContentSizeCategoryDidChangeNotification,
                                            object:nil)
  end

  def font_changed(notification)
    self.tableView.reloadData
  end

end
