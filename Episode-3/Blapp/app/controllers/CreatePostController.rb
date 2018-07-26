class CreatePostController < UIViewController

  def init
    super

    self.title = 'Create Post'
    self.tabBarItem = UITabBarItem.alloc.initWithTitle('Create Post', image:UIImage.imageNamed('New'), tag:1)

    @postModel = UIApplication.sharedApplication.delegate.postsModel

    self
  end

  def viewDidLoad
    @createPostView = CreatePostView.alloc.initWithFrame(self.view.frame)
    @createPostView.delegate = self
    self.view.addSubview(@createPostView)
  end

  def createPostView(_, didCreatePostWithDetails:details)
    @postModel.addRecord(details)

    alert = UIAlertController.alertControllerWithTitle('Post Saved',
                                                       message: nil,
                                                       preferredStyle: UIAlertControllerStyleAlert)
    action = UIAlertAction.actionWithTitle('Ok', style: UIAlertActionStyleDefault, handler: nil)
    alert.addAction(action)
    presentViewController(alert, animated: true, completion: nil)
  end

end
