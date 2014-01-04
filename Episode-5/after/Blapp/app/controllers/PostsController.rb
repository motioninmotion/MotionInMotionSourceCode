class PostsController < UITableViewController
  include PostsControllerTableViewDataSource
  include PostsControllerTableViewDelegate
  include PostsControllerAlertViewDelegate

  attr_accessor :posts

  def init
    super
    self.title = "Posts"
    self.tabBarItem = UITabBarItem.alloc.initWithTitle("Posts", image:UIImage.imageNamed("Newspaper"), tag:0)
    self.posts = []
    self
  end

end
