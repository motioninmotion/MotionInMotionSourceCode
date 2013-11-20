class PostDetailView < UIView

  attr_accessor :contentView

  def initWithFrame(frame)
    super

    self.backgroundColor = UIColor.whiteColor

    self.contentView = UITextView.alloc.initWithFrame(self.frame)
    self.contentView.textContainerInset = UIEdgeInsetsMake(20, 15, 20, 15)
    self.contentView.editable = false
    self.addSubview(self.contentView)

    self
  end

end
