class PostDetailController < UIViewController

  def initWithPostDetails(postDetails)
    init
    @postDetails = postDetails
    self.title = @postDetails[:author]
    self
  end

  def viewDidLoad
    @postDetailView = PostDetailView.alloc.initWithFrame(self.view.frame)
    @postDetailView.contentView.text = @postDetails[:content]
    self.view.addSubview(@postDetailView)
  end

end
