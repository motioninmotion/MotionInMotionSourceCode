class PostView < UIView
  def initWithFrame(frame, andPost:post)
    self.initWithFrame(frame)
    @post = post
    self.configure
    self
  end

  def configure
    self.backgroundColor = UIColor.lightGrayColor
    self.addSubview(contentView)
    self.addSubview(authorAreaLabel)
    self.addSubview(authorBioView)
  end

  def contentView
    @contentView ||= UITextView.new.tap do |cv|
      contentViewFrame = self.frame
      contentViewFrame.size.height -= 150
      cv.frame = contentViewFrame
      cv.textContainerInset = UIEdgeInsetsMake(20, 20, 20, 20)
      cv.textContainer.lineFragmentPadding = 0.0
      cv.editable = false
      cv.text = @post.content
    end
  end

  def authorAreaLabel
    @authorAreaLabel ||= UILabel.new.tap do |aal|
      aal.frame = CGRectMake(20, self.frame.size.height - 150, self.frame.size.width - 40, 30)
      aal.text = "About #{@post.pseudonym.name}"
      aal.font = UIFont.boldSystemFontOfSize(15)
    end
  end

  def authorBioView
    @authorBioView ||= UITextView.new.tap do |abv|
      abv.frame = CGRectMake(0, self.frame.size.height - 120, self.frame.size.width, 100)
      abv.editable = false
      abv.text = @post.pseudonym.bio
      abv.textContainer.lineFragmentPadding = 0.0
      abv.textContainerInset = UIEdgeInsetsMake(0, 20, 0, 20)
      abv.backgroundColor = UIColor.clearColor
    end
  end
end
