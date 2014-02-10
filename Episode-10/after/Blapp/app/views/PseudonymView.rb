class PseudonymView < UIView

  def initWithFrame(frame, andPseudonym:pseudonym)
    self.initWithFrame(frame)
    @pseudonym = pseudonym
    self.displayForm
    self
  end

  def displayForm
    self.addSubview(nameLabel)
    self.addSubview(nameField)
    self.addSubview(bioLabel)
    self.addSubview(bioField)
  end

  def nameLabel
    @nameLabel ||= UILabel.new.tap do |l|
      l.frame = CGRectMake(20, 20, self.frame.size.width - 40, 30)
      l.text = "Name of your pseudonym"
      l.font = UIFont.systemFontOfSize(13)
    end
  end

  def nameField
    @nameField ||= UITextField.new.tap do |f|
      f.frame = CGRectMake(20, 50, self.frame.size.width - 40, 30)
      f.placeholder = "Enigma"
      f.text = @pseudonym.name
    end
  end

  def bioLabel
    @bioLabel ||= UILabel.new.tap do |l|
      l.frame = CGRectMake(20, 100, self.frame.size.width - 40, 30)
      l.text = "Your pseudonym's bio"
      l.font = UIFont.systemFontOfSize(13)
    end
  end

  def bioField
    @bioField ||= UITextView.new.tap do |f|
      f.frame = CGRectMake(0, 130, self.frame.size.width, 100)
      f.font = UIFont.systemFontOfSize(15)
      f.text = @pseudonym.bio || "A very enigmatic writer..."
      f.textContainerInset = UIEdgeInsetsMake(0, 20, 0, 20)
      f.textContainer.lineFragmentPadding = 0.0
    end
  end

end
