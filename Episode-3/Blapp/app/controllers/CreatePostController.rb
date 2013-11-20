class CreatePostController < UIViewController

  def init
    super

    self.title = "Create Post"
    self.tabBarItem = UITabBarItem.alloc.initWithTitle("Create Post", image:UIImage.imageNamed('New'), tag:1)

    @postModel = UIApplication.sharedApplication.delegate.postsModel

    self
  end

  def viewDidLoad
    @createPostView = CreatePostView.alloc.initWithFrame(self.view.frame)
    @createPostView.delegate = self
    self.view.addSubview(@createPostView)
  end

  def createPostView(createPostView, didCreatePostWithDetails:details)
    @postModel.addRecord(details)

    alert = UIAlertView.new
    alert.title = "Post Saved"
    alert.addButtonWithTitle("OK")
    alert.show
  end

end
