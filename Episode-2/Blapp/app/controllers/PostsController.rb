class PostsController < UITableViewController

  def init
    super

    self.title = "Posts"
    self.tabBarItem = UITabBarItem.alloc.initWithTitle("Posts", image:UIImage.imageNamed('Signpost'), tag:1)

    @postsModel = UIApplication.sharedApplication.delegate.postsModel

    self
  end

  def viewDidLoad
  end

  def viewDidAppear(animated)
    super
  end

end
