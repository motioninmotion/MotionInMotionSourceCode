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

end
