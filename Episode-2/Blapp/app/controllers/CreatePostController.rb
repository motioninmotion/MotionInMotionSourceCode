class CreatePostController < UIViewController

  def init
    super

    self.title = "Create Post"
    self.tabBarItem = UITabBarItem.alloc.initWithTitle("Create Post", image:UIImage.imageNamed('New'), tag:1)

    self
  end

  def viewDidLoad
    @createPostView = CreatePostView.alloc.initWithFrame(self.view.frame)
    self.view.addSubview(@createPostView)
  end

end
