class CreatePostView < UIView

  def initWithFrame(frame)
    super

    self.backgroundColor = UIColor.whiteColor

    @authorField = UITextField.alloc.initWithFrame(CGRectMake(20, 40, 280, 50))
    @authorField.placeholder = "Author Name"
    @authorField.returnKeyType = UIReturnKeyDone
    @authorField.delegate = self
    self.addSubview(@authorField)

    @contentField = UITextView.alloc.initWithFrame(CGRectMake(20, 110, 280, 150))
    @contentField.text = "Post Content"
    @contentField.returnKeyType = UIReturnKeyDone
    @contentField.delegate = self
    self.addSubview(@contentField)

    @createPostButton = UIButton.alloc.initWithFrame(CGRectMake(20, 280, 280, 50))
    @createPostButton.setTitle("Create Post", forState:UIControlStateNormal)
    @createPostButton.backgroundColor = UIColor.colorWithRed(0.51, green:0.792, blue:0.612, alpha:1)
    self.addSubview(@createPostButton)

    self
  end

  def textFieldShouldReturn(textField)
    textField.resignFirstResponder
    true
  end

  def textView(textView, shouldChangeTextInRange:range, replacementText:text)
    if text == "\n"
      textView.resignFirstResponder
      return false
    end
    true
  end

end
