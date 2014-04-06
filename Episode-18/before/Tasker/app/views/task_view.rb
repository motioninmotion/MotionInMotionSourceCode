class TaskView < UIScrollView
  attr_accessor :name_field, :note_field, :date_picker

  def init
    super

    self.backgroundColor = UIColor.whiteColor

    self.name_field = TextField.new.tap do |v|
      v.frame = [[20, 20], [280, 40]]
      v.placeholder = "e.g. Do the dishes"
      v.layer.borderWidth = 1
      v.layer.borderColor = UIColor.grayColor.CGColor
      v.layer.cornerRadius = 3
      v.delegate = self
      v.returnKeyType = UIReturnKeyDone
    end
    self.addSubview(self.name_field)

    @notes_label = UILabel.new.tap do |v|
      v.frame = [[20, 80], [280, 0]]
      v.text = "Notes"
      v.font = UIFont.boldSystemFontOfSize(14)
      v.textColor = UIColor.darkGrayColor
      v.sizeToFit
    end
    self.addSubview(@notes_label)

    self.note_field = UITextView.new.tap do |v|
      v.frame = [[20, CGRectGetMaxY(@notes_label.frame) + 5], [280, 100]]
      v.layer.borderWidth = 1
      v.layer.borderColor = UIColor.grayColor.CGColor
      v.layer.cornerRadius = 3
      v.font = UIFont.systemFontOfSize(14)
      v.textContainerInset = UIEdgeInsetsMake(10, 5, 10, 5)
      v.delegate = self
    end
    self.addSubview(self.note_field)

    self.date_picker = UIDatePicker.new.tap do |v|
      v.frame = [[0, CGRectGetMaxY(self.note_field.frame) + 20], [320, 100]]
    end
    self.addSubview(self.date_picker)

    self
  end

  def textFieldShouldReturn(textField)
    textField.resignFirstResponder
    true
  end
end