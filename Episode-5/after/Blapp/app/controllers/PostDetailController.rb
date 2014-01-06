class PostDetailController < UIViewController
  attr_accessor :post

  def initWithPost(post)
    self.init
    self.post = post
    self.title = post.title
    self
  end

  def viewDidLoad
    self.navigationItem.rightBarButtonItem = editButton
    @postView = PostView.alloc.initWithFrame(self.view.frame, andPost:self.post)
    self.view.addSubview(@postView)
  end

  def edit
    self.navigationItem.setRightBarButtonItem(saveButton, animated:true)
    @postView.contentView.editable = true
    @postView.contentView.becomeFirstResponder
  end

  def save
    self.navigationItem.setRightBarButtonItem(editButton, animated:true)
    @postView.contentView.resignFirstResponder
    @postView.contentView.editable = false
    self.post.content = @postView.contentView.text
    self.post.updated_at = Time.now
    cdq.save
    self.navigationController.viewControllers[0].tableView.reloadData
  end

  def editButton
    @editButton ||= UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemEdit, target:self, action:'edit')
  end

  def saveButton
    @saveButton ||= UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemSave, target:self, action:'save')
  end

end
